class Category < ApplicationRecord
  has_many :services
  has_many :skills
end
