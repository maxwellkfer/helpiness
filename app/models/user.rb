 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  has_many :skills
  has_many :services
  has_many :bookings

  belongs_to :university, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

before_save :default_values

  def default_values
    self.helpies ||= 60
  end

  def avatar_or_default
    if avatar_url
      avatar_url
    else
      "https://pbs.twimg.com/profile_images/415011885646639104/KoviHCMP.jpeg"
    end
  end

end
