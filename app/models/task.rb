class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence :true

  scope :completed_tasks, -> {where(completed: true)}
end
