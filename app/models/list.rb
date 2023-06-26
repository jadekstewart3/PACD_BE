class List < ApplicationRecord
  belongs_to :trip
  has_many :items
end
