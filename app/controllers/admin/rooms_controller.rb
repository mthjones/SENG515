class Admin::RoomsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @rooms = Room.order("location ASC, room_no ASC")
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params[:room])
    if @room.save
      flash[:success] = "Room successfully saved!"
      redirect_to admin_rooms_path
    else
      render :new
    end
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:success] = "Room successfully saved!"
      redirect_to admin_rooms_path
    else
      render :edit
    end
  end
  
  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room successfully deleted!"
    redirect_to admin_rooms_path
  end
end
