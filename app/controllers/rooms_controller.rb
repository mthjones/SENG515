class RoomsController < ApplicationController
  respond_to :json
  
  def index
    equipment_ids = params[:equipment_ids].split(",").collect { |s| s.to_i }
    @rooms = Room.select { |r| r unless (r.equipment_ids & equipment_ids).empty? }
    respond_with @rooms
  end
end
