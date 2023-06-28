class List < ApplicationRecord
  belongs_to :trip
  has_many :items

  validates_presence_of :title
end
