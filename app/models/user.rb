class User < ApplicationRecord
  has_many :user_trips
  has_many :trip, through: :user_trips
  has_many :user_lists
  has_many :lists, through: :user_lists
end
