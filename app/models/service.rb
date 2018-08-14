class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings

  mount_uploader :photo, PhotoUploader
end
