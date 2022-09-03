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
                  using: {
                         tsearch: { prefix: true }
                         }

  def set_chatroom
    Chatroom.create!(name: "#{artist} on #{date}", concert_id: id)
  end

  def set_user_concert(concert_id)
    if UsersConcert.exists?(concert_id: concert_id)
      @usersconcert = UsersConcert.find_by(concert_id: concert_id)
    else
      @usersconcert = UsersConcert.new
    end
  end
end
