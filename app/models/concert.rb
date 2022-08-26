class Concert < ApplicationRecord
  has_one :chatroom
  has_many :users
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_artist_address_venue_and_description,
    against: [ :artist, :address, :venue, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
