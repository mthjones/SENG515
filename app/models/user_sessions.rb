class UserSessions < ActiveRecord::Base
  attr_accessible :session_id, :user_id
  belongs_to :user
  belongs_to :session
end
