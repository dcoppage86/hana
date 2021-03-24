class UserProject < ApplicationRecord
    belongs_to :user
    belongs_to :projects
end
