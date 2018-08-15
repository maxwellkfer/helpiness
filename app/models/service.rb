class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings

  has_many :customers, through: :bookings

  mount_uploader :photo, PhotoUploader
end
