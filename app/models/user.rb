 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  after_create :send_welcome_email
  has_many :skills, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

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
      "helpster-mini.png"
    end
  end
private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
