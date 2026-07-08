class UsersController < ApplicationController
    skip_before_action :role_init,only: %i[show]
    def index
        @users = User.all
    end


    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        blanks = %i[email password name role].select do |field|
            params[:user][field].blank?
        end

        if blanks.any?
            flash.now[:notice] = "#{blanks.join(',')}は必須項目です"
            render :new, status: :unprocessable_entity
            return
        end

        if @user.save
            redirect_to users_path
        else
            flash.now[:notice]
            render :new, status: :unprocessable_entity
            return
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :role)
    end
end