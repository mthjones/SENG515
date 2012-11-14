class RoomEquipment < ActiveRecord::Base
  attr_accessible :equipment_id, :quantity, :room_id
  belongs_to :room
  belongs_to :equipment
end
