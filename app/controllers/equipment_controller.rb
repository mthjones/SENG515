class EquipmentController < ApplicationController
  
 def index
     @Equipments = Equipment.all.reverse
      session[:return_to] = request.url
 end
 def show
       @equipment = Equipment.find(params[:id])
      session[:return_to] = request.url
  end
 def new
    if current_user_is_admin
      @equipment = Equipment.new
    else
      redirect_to new_user_session_path
    end
 end
 
 def create
    if current_user_is_admin
      @equipment = Equipment.new(params[:equipment])
      if @equipment.save
        flash[:success] = "Equipement successfully added!"
        redirect_to @equipment
      else
        render 'new'
      end
    else
      redirect_to status: 404
    end
  end
  
  def edit
    if current_user_is_admin
      @equipment = Equipment.find(params[:id])
    else
      redirect_to new_user_session_path
    end 
  end
  
  def update
    if current_user_is_admin
      @equipment = Equipment.find(params[:id])
      if @equipment.update_attributes(params[:equipment])
        flash[:success] = "Equipment successfully updated!"
        redirect_to @equipment
      else
        render 'edit'
      end
    else
      redirect_to status: 404
    end
  end
  
  def destroy
    if current_user_is_admin
      Equipment.find(params[:id]).destroy
      flash[:success] = "Equipment successfully deleted!"
      redirect_to equipment_index_path
    else
      redirect_to new_user_session_path
    end
  end
end
