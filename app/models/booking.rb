class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :customer, class_name: "User", foreign_key: "user_id"
  has_many :reviews
  enum status: {pending: 0, accepted: 1, declined: 2, completed: 3 }
  #validates :status_id, presence: true
  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :status, presence: true
end
