class Budget < ActiveRecord::Base
  belongs_to :workshop
  attr_accessible :accomodation_cost, :vendor_cost
end
