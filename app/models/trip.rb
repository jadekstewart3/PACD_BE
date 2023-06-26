class Trip < ApplicationRecord
  has_many :lists
  has_many :user_trips
  has_many :users, through: :user_trips
end
