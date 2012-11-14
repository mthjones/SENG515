class Admin::RoomsController < ApplicationController
  def index
    @rooms = Room.all
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
      redirect_to :index
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
      redirect_to :index
    else
      render :edit
    end
  end
  
  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room successfully deleted!"
    redirect_to :index
  end
end
