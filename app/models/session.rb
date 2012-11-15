class Session < ActiveRecord::Base
  attr_accessible :description, :end_datetime, :start_datetime, :title, :room_id
  
  belongs_to :workshop
  belongs_to :room
  
  validates :room, presence: true
  validates :title, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true

  validate :validate_end_datetime_later_than_start_datetime

  def validate_end_datetime_later_than_start_datetime
    if self.end_datetime && self.start_datetime && (self.start_datetime > self.end_datetime)
      self.errors.add(:end_datetime, "must be a later date than the start date.")
    end
  end
end
