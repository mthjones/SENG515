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
    #@sessions = @user.session.find(params[:user_id])
  end
end
