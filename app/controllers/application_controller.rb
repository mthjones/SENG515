class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :current_user_is_admin

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_is_admin
  	return current_user && current_user.user_type == "Admin"
  end
  
end
