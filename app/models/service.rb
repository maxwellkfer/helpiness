class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy

  has_many :customers, through: :bookings

  mount_uploader :photo, PhotoUploader

  include PgSearch

  pg_search_scope :global_search,
  against: [ :name, :helpies, :rating ],
  associated_against: {
    category: [ :name ],
    user: [ :university_id ]
  },
  using: {
    tsearch: { prefix: true }
  }

  def photo_or_default
    if photo_url
      photo_url
    else
      "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=349f0586d07c10fdf29da504276b5407&auto=format&fit=crop&w=2100&q=80"
    end
  end
end

