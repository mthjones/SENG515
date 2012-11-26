class Post < ActiveRecord::Base
  attr_accessible :content, :title, :admin_only
  
  validates :title, presence: true
  validates :content, presence: true
end
