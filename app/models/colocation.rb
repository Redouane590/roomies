class Colocation < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  has_many :notes
end
