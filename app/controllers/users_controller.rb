class UsersController < ApplicationController
    skip_before_action :role_init, only: %i[show]
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])

        unless current_user.role == "admin" || @user == current_user
            redirect_to homes_path, alert: "権限がありません"
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        blanks = blank_fields(:user, %i[email name role])

        if blanks.any?
            flash.now[:alert] = "#{blanks.join(',')}は必須項目です"
            render :edit, status: :unprocessable_entity
            return
        end

        if @user.update(user_params)
            redirect_to users_path, notice: "#{@user.name}のユーザ情報が更新されました"
        else
            flash.now[:alert] = "#{@user.name}のユーザ情報の更新に失敗しました"
            render :edit, status: :unprocessable_entity
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        blanks = blank_fields(:user, %i[email password name role])

        if blanks.any?
            flash.now[:alert] = "#{blanks.join(',')}は必須項目です"
            render :new, status: :unprocessable_entity
            return
        end

        if @user.save
            redirect_to users_path, notice: "#{@user.name}の作成に成功しました"
        else
            flash.now[:alert] = "ユーザの作成に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "#{@user.name}の削除に成功しました"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :role)
    end
end
