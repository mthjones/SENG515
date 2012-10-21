class UsersController < ApplicationController
  def new
    @user = User.new
    session[:return_to] = request.url
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed up!"
      redirect_to root_url
    else
      render "new"
    end
  end
end
