class ApplicationController < ActionController::Base
  before_action :user_init
  before_action :role_init
  helper_method :current_user


  def user_init
      redirect_to root_path,
      notice: "ログインをしてください" if current_user == nil
  end

  def role_init
      redirect_to homes_path,
      notice: "権限がありません" unless current_user.role == "admin"
  end

private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
