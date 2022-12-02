class Colocation < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  has_many :notes, dependent: :destroy
  has_many :lists
  has_many :items, through: :lists
  # has_many :user_colocations
  has_many :user_colocations

  has_many :users, through: :user_colocations
  has_many :events
end
