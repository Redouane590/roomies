class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  validates :nickname, presence: true
  # validates :phone_number
  # validates :status
  has_many :user_colocations

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@gmail.com\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
