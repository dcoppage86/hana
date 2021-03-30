class User < ApplicationRecord
  has_many :tasks
  has_many :comments
  has_many :projects, through: :tasks
  has_many :user_projects, through: :comments, source: :project

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum:8, maximum:16}
  
  

  has_secure_password

end
