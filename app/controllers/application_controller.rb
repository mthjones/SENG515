class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location
  
  def after_sign_in_path_for(resource)
    session[:return_to]
  end
  
  private
    def store_location
      session[:return_to] = request.fullpath
    end
end
