class FailsController < ApplicationController
    def reset_login_fails
       session[:login_failed_count] = 0
       redirect_to root_path 
    end
end
