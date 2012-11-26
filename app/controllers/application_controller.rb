class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location
  
  def after_sign_in_path_for(resource)
    session[:return_to]
  end
  
  def after_sign_out_path_for(resource)
    request.referrer
  end
  
  private
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def authenticate_admin!
      if current_user.try(:admin?)
        return true
      end
      redirect_to new_user_session_path
      return false
    end
end
