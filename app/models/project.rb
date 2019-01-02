class Project < ApplicationRecord
  # belongs_to :manager, foreign_key: :user_id, class_name: "User"
  has_many :todos, dependent: :destroy
  has_and_belongs_to_many :developers, class_name: "User"

  validates :name, presence: true
end
