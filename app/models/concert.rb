class Concert < ApplicationRecord
  has_one :chatroom
  has_many :users
  has_many :users_concerts
  has_many :users, through: :users_concerts
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :set_chatroom

  include PgSearch::Model
  pg_search_scope :search_by_artist_address_venue_genre_description,
                  against: %i[artist address venue description genre],
                  using: { tsearch: { prefix: true } }

  private

  def set_chatroom
    Chatroom.create!(name: "#{artist} on #{date}", concert_id: id)
  end
end
