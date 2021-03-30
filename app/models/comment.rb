class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :subject, presence: true
  validates :content, presence: true, length: {minimum:3, maximum:100}
end
