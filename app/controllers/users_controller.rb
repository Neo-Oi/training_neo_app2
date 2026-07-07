class UsersController < ApplicationController
    before_action :user_init, only: %i[show]
    before_action :role_init, only: %i[index]

    def user_init 
        redirect_to root_path if current_user == nil
    end
    
    def role_init
            return redirect_to root_path if current_user.nil?
        redirect_to user_path(current_user) if current_user.role == "member"
    end

    def index
        @users = User.all
    end


    def show
        @user = User.find(params[:id])
    end
end