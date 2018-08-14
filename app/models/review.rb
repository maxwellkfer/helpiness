class Review < ApplicationRecord
  belongs_to :booking
  validates :comments, length: { minimum: 20 }
end
