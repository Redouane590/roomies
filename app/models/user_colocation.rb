class UserColocation < ApplicationRecord
  # belongs_to :user   A VOIR
  # belongs_to :colocation_id
  belongs_to :user
  belongs_to :colocation
  # belongs_to :colocation
  validates_uniqueness_of :colocation_id, scope: :user_id
end
