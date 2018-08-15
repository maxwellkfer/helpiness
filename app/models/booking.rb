class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :reviews
  validates :status_id, presence: true
  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :status, presence: true
end
