class Item < ApplicationRecord
  belongs_to :list
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
end
