class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @verified_users = User.where(verified: true)
    @unverified_users = User.where(verified: false)
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
  
  def promote
    user = User.find(params[:id])
    user.admin = true
    user.save
    flash[:success] = "User successfully promoted to admin!"
    redirect_to admin_users_path
  end
  
  def demote
    if User.where(admin: true).count <= 1
      flash[:error] = "Can not have 0 admins."
    else
      user = User.find(params[:id])
      user.admin = false
      user.save
      flash[:success] = "User successfully demoted from admin!"
    end
    redirect_to admin_users_path
  end
end
