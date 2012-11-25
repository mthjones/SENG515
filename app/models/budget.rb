class Budget < ActiveRecord::Base
  belongs_to :workshop
  attr_accessible :accomodation_cost, :venue_cost
end
