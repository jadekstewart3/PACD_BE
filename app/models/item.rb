class Item < ApplicationRecord
  has_many :list_items
  has_many :lists, through: :list_items
end
