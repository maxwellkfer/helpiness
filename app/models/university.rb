class University < ApplicationRecord
  has_many :users, dependent: :destroy
end
