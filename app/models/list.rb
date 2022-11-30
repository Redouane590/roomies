class List < ApplicationRecord
  belongs_to :colocation
  validates :title, presence: true, length: { minimum: 2 }
end
