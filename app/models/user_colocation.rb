class UserColocation < ApplicationRecord
  belongs_to :user_id
  belongs_to :colocation_id
end
