class UserColocation < ApplicationRecord
  # belongs_to :user   A VOIR
  # belongs_to :colocation_id
  has_many :users
  # has_many :colocations
  belongs_to :colocation
end
