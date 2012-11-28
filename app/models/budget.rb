class Budget < ActiveRecord::Base
  belongs_to :workshop
  has_many :expenses, dependent: :destroy
  attr_accessible :accomodation_cost, :venue_cost, :expenses_attributes
  
  accepts_nested_attributes_for :expenses, :allow_destroy => true
  
  def total
    return accomodation_cost + venue_cost + expenses.map(&:amount).sum
  end
end
