class LoginsController < ApplicationController
    skip_before_action :user_init,only: %i[index create destroy]
    skip_before_action :role_init,only: %i[index create destroy]

    def create
        session[:login_failed_count] ||= 0
        if session[:login_failed_count] >= 2
           flash[:notice] = "ログイン回数が３回を超えました"
           redirect_to fails_path
           return
        end

        user = User.find_by(email: params[:login][:email])

        blanks = %i[email password].select do |field|
            params[:login][field].blank?
        end

        if blanks.any?
            flash.now[:notice] = "#{blanks.join(',')}は必須項目です"
            render :index, status: :unprocessable_entity
            return
        end

        if user&.authenticate(params[:login][:password])
            session[:user_id] = user.id
            session[:login_failed_count] = 0
            redirect_to homes_path
            return
        else
            session[:login_failed_count] += 1
            flash.now[:notice] = "#{session[:login_failed_count]}回目の失敗　原因:パスワードまたはメールアドレスが異なります。"
            render :index, status: :unprocessable_entity
            return
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end