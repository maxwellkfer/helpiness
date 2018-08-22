class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :service_owner, class_name: "User", foreign_key: "user_id"
  validates :comments, length: { minimum: 20 }
end
