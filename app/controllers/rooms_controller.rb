class RoomsController < ApplicationController
  respond_to :json
  
  def index
    equipment_ids = params[:equipment_ids].split(",").collect { |s| s.to_i }
    @rooms = Room.all.select { |r| r if (r.equipment_ids & equipment_ids) == equipment_ids }
    respond_with @rooms
  end
end
