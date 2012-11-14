class Admin::EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
  end
  
  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def create
    @equipment = Equipment.new(params[:equipment])
    if @equipment.save
      flash[:success] = "Equipment successfully saved!"
      redirect_to :index
    else
      render :new
    end
  end
  
  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(params[:equipment])
      flash[:success] = "Equipment successfully saved!"
      redirect_to :index
    else
      render :edit
    end
  end
  
  def destroy
    Equipment.find(params[:id]).destroy
    flash[:success] = "Equipment successfully deleted!"
    redirect_to :index
  end
end
