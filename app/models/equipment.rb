class Equipment < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :room_equipment
  has_many :room, :through => :room_equipment
end
