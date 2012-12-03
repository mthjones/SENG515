class RegisteredUsersController < ApplicationController
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
   # @users = Users.find(params[:id])
    #if @users.update_attributes(params[:email])
      #flash[:success] = "Equipment successfully saved!"
     # redirect_to admin_registered_users_index_path
    #else
     # render :edit
   # end
  end
  
  def destroy
    Users.find(params[:id]).destroy
    flash[:success] = "User successfully deleted!"
    redirect_to admin_registered_users_index_path
  end

end

