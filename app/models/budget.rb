class Budget < ActiveRecord::Base
  belongs_to :workshop
  has_many :expenses
  attr_accessible :accomodation_cost, :venue_cost
end
