class HomesController < ApplicationController
        before_action :user_init

    def user_init 
        redirect_to root_path if current_user == nil
    end
end