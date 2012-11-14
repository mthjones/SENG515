class Room < ActiveRecord::Base
  attr_accessible :description, :level, :location, :room_no
end
