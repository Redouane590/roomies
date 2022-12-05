class List < ApplicationRecord
  belongs_to :colocation
  has_many :items, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }

end
