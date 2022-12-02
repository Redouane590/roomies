class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :colocation
  validates :colocation_id, presence: true
end
