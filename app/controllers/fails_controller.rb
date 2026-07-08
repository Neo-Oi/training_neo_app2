class FailsController < ApplicationController
    skip_before_action :user_init
    skip_before_action :role_init

    def reset_login_fails
       session[:login_failed_count] = 0
       redirect_to root_path 
    end
end
