class LoginsController < ApplicationController
    skip_before_action :user_init, only: %i[index create destroy]
    skip_before_action :role_init, only: %i[index create destroy]

    def create
        session[:login_failed_count] ||= 0

        if session[:login_failed_count] >= 2
           redirect_to fails_path, alert: "ログイン回数が３回を超えました"
           return
        end

        blanks = blank_fields(:login, %i[email password])

        if blanks.any?
            flash.now[:alert] = "#{blanks.join(',')}は必須項目です"
            render :index, status: :unprocessable_entity
            return
        end

        user = User.find_by(email: params[:login][:email])

        if user&.authenticate(params[:login][:password])
            session[:user_id] = user.id
            session[:login_failed_count] = 0
            redirect_to homes_path, notice: "ログインに成功しました"
            return
        else
            session[:login_failed_count] += 1
            flash.now[:alert] = "#{session[:login_failed_count]}回目の失敗　原因:パスワードまたはメールアドレスが異なります。"
            render :index, status: :unprocessable_entity
        end
    end

    def destroy
        reset_session
        redirect_to root_path, notice: "ログアウトしました"
    end
end
