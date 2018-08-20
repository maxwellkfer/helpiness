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
      "https://m.media-amazon.com/images/M/MV5BMjI5MzgxMTQ4M15BMl5BanBnXkFtZTgwNjczMTk0NzE@._V1_UX477_CR0,0,477,268_AL_.jpg"
    end
  end

end
