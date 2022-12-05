class Note < ApplicationRecord
  belongs_to :colocation
  validates :title, presence: true
  validates :content, presence: true
end
