class Category < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :skills, dependent: :destroy
  validates :name, presence: true
end
