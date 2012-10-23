class Session < ActiveRecord::Base
  attr_accessible :description, :end_datetime, :start_datetime, :title
end
