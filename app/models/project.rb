class Project < ApplicationRecord

    has_many :tasks
    has_many :comments
    has_many :users, through: :tasks

    validates :name, presence: :true
    validates :content, presence: :true 
    validates :content, length: {maximum: 50, message: "%{count} characters is the max!"}

    scope :completed_projects, -> {where(completed: true)}
end
