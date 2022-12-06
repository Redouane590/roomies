require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable,
      :omniauthable, omniauth_providers: [:google_oauth2]

  validates :nickname, presence: true
  # validates :phone_number
  # validates :status
  has_many :user_colocations
  has_many :colocations, through: :user_colocations
  has_one_attached :photo




  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.nickname = auth.info.name # assuming the user model has a name
      photo = URI.open(auth.info.image)
      user.photo.attach(io: photo, filename: "#{user.nickname}.png", content_type: "image/jpg")
      # user.avatar_url = auth.info.image # assuming the user model has an image
    end
  end
end


