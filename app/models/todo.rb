class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :developer, foreign_key: :user_id, class_name: 'User'

  validates :title, :description, :status, presence: true
end
