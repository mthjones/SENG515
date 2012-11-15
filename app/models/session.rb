class Session < ActiveRecord::Base
  attr_accessible :description, :end_datetime, :start_datetime, :title, :room_id
  
  belongs_to :workshop
  belongs_to :room
  
  validates :room, presence: true
  validates :title, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  
  validate :at_least_15_minutes
  validate :end_datetime_later_than_start_datetime
  validate :room_not_double_booked
  
  def at_least_15_minutes
    if (self.end_datetime - self.start_datetime) < 15.minutes
      self.errors.add(:end_datetime, "must be at least 15 minutes after start time.")
    end
  end

  def end_datetime_later_than_start_datetime
    if self.end_datetime && self.start_datetime && (self.start_datetime > self.end_datetime)
      self.errors.add(:end_datetime, "must be a later date than the start date.")
    end
  end
  
  def room_not_double_booked
    self.room.sessions.each do |sess|
      unless self == sess
        if self.overlaps_times_with(sess)
          self.errors.add(:room, "is already booked at the selected times.")
          break
        end
      end
    end
  end
  
  protected
  
  def overlaps_times_with(other)
    !((self.start_datetime <= other.start_datetime && self.end_datetime <= other.start_datetime)|| (self.start_datetime >= other.end_datetime && self.end_datetime >= other.end_datetime))
  end
end
