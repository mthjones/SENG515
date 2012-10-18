class Workshop < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
