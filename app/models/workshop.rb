class Workshop < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title
  
  has_many :sessions, dependent: :destroy
  has_one :budget, dependent: :destroy

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :validate_end_date_later_than_start_date

  def validate_end_date_later_than_start_date
  	if self.end_date && self.start_date && (self.start_date > self.end_date)
  		self.errors.add(:end_date, "must be a later date than the start date.")
  	end
  end
  
  def finished?
    return self.end_date < Date.today
  end
  
  def in_progress?
    return !self.finished? && self.start_date < Date.today
  end
end
