class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings

  has_many :customers, through: :bookings

  mount_uploader :photo, PhotoUploader

  include PgSearch

  pg_search_scope :global_search,
  against: [ :helpies, :rating, :category_id, ],
  associated_against: {
    category: [ :name ],
    review: [ :stars ],
    user: [ :univerity ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
