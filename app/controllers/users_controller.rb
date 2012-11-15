class UsersController < ApplicationController
  def new
    @user = User.new
    session[:return_to] = request.url
  end

  def create
    @user = User.new(params[:user])
    @user.user_type = User.count == 0 ? "Admin" : "Attendee"
    if @user.save
      flash[:success] = "Signed up!"
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render "new"
    end
  end
end
