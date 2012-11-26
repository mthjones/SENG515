class Expense < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :amount, :name
  
  validates :name, presence: true
  validates :amount, presence: true
end
