class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id, :user_id
  belongs_to :user
  belongs_to :list
end
