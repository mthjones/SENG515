class Equipment < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_and_belongs_to_many :rooms
end
