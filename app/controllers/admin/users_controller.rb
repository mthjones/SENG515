class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  def show
    @users = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
   @users = Users.find(params[:id])
    if @users.update_attributes(params[:email])
      flash[:success] = "Equipment successfully saved!"
     redirect_to admin_users_path
    else
      render :edit
    end
  end  

  def destroy
    user = User.find(params[:id])
    if user.admin?
      flash[:error] = "Can not delete an admin. If deleting an admin was intentional, please demote them before deleting."
    else
      user.destroy
      flash[:success] = "User successfully deleted!"
    end
    redirect_to admin_users_path
  end
end
