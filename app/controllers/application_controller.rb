class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def authenticate_admin!
      if current_user.try(:admin?)
        return true
      end
      redirect_to new_user_session_path
      return false
    end
end
