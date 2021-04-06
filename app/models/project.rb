class Project < ApplicationRecord

    has_many :tasks, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :users, through: :tasks

    validates :name, presence: :true
    validates :content, presence: :true 
    validates :content, length: {maximum: 50, message: "%{count} characters is the max!"}

    scope :listed_projects, -> { where(project: true)}

    def self.search(term)
        where("name like :term", term: "%#{term}%")
    end

    
end
