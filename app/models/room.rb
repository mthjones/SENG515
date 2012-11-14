class Room < ActiveRecord::Base
  attr_accessible :description, :level, :location, :room_no, :equipment_ids
  
  has_and_belongs_to_many :equipment
end
