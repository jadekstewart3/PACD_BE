class User < ApplicationRecord
  has_many :user_trips
  has_many :trip, through: :user_trips
  has_many :user_lists
  has_many :lists, through: :user_lists

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end
