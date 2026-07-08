class ApplicationController < ActionController::Base
before_action :user_init
before_action :role_init
helper_method :current_user


  def user_init 
      redirect_to root_path if current_user == nil
  end

  def role_init
      return redirect_to root_path if current_user.nil?
      redirect_to user_path(current_user) if current_user.role == "member"
  end

private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
