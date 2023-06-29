class Item < ApplicationRecord
  has_many :list_items
  has_many :lists, through: :list_items

  validates_presence_of :name, :quantity
  validates_numericality_of :quantity, greater_than: 0
end
