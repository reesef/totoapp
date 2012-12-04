class List < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :user_id
  belongs_to :user
  has_many :tasks
end
