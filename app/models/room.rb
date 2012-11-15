class Room < ActiveRecord::Base
  attr_accessible :description, :level, :location, :room_no, :equipment_ids
  
  validates :room_no, presence: true
  validates :location, presence: true
  
  has_many :sessions
  has_and_belongs_to_many :equipment
end
