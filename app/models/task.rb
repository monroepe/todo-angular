class Task < ActiveRecord::Base
  belongs_to :task_list
  belongs_to :user

  validates :title, :user_id, :task_list_id, presence: true
end
