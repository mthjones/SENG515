class Expense < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :amount, :name
end
