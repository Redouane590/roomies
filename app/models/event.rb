class Event < ApplicationRecord
  belongs_to :colocation
  validates :name, presence: true
  validates :content, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
