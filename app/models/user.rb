 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :skills
  has_many :services
  has_many :bookings

  belongs_to :university, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
