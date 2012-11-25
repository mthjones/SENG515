class MySessionsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = current_user
    @user.sessions = Users_Sessions.new(:user_id => "5" :session_id =>"1")
    
    #@sessions = @user.session.find(params[:user_id])
  end
end
