class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :phone_number
  # validates :status
  has_many :user_colocations
  has_many :colocations, through: :user_colocations
  has_one_attached :photo
end
