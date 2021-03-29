class Project < ApplicationRecord

    has_many :tasks
    has_many :comments
    has_many :users, through: :tasks

    validates :name, presence: :true
    validates :content, presence: :true
end
