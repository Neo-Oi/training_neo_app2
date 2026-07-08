class LoginsController < ApplicationController
    skip_before_action :user_init,only: %i[index create]
    skip_before_action :role_init,only: %i[index create]

    def create
        session[:login_failed_count] ||= 0
        if session[:login_failed_count] >= 2
           flash[:notice] = "ログイン回数が３回を超えました"
           redirect_to fails_path
           return
        end

        user = User.find_by(email: params[:login][:email])

        if params[:login][:email]&&params[:login][:password].blank?
            flash.now[:notice] = "emailとpasswordは必須項目です"
            render :index
            return
        elsif params[:login][:email].blank?
            flash.now[:notice] = "emailは必須項目です"
            render :index
            return
        elsif params[:login][:password].blank?
            flash.now[:notice] = "passwordは必須項目です"
            render :index
            return
        end

        if user&.authenticate(params[:login][:password])
            session[:user_id] = user.id
            session[:login_failed_count] = 0
            redirect_to homes_path
            return
        else
            session[:login_failed_count] += 1
            flash.now[:notice] = "#{session[:login_failed_count]}回目の失敗　パスワードまたはメールアドレスが異なります。"
            render :index
            return
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end