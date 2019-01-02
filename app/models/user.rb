class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :role, presence: true

  has_and_belongs_to_many :projects
  has_many :todos

  scope :manager, -> { where(role: :manager) }
  scope :developer, -> { where(role: :developer) }

  def role?(value)
    self.role == value
  end
end