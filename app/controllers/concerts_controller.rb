class ConcertsController < ApplicationController
  before_action :set_concert, only: :show

  def index
    @fav_concerts = Concert.all.sample(4)
    if params[:query].present?
      @concerts = Concert.search_by_artist_address_venue_genre_description(params[:query])
    else
      @concerts = Concert.all.order(created_at: :asc)
    end
    @markers = @concerts.geocoded.map do |concert|
      {
        lat: concert.latitude,
        lng: concert.longitude,
        info_window: render_to_string(partial: "info_window", locals: { concert: concert }),
        image_url: helpers.asset_url("logo.png"),
      }
    end
  end

  def show
    if UsersConcert.exists?(concert_id: params[:id])
      @usersconcert = UsersConcert.find_by(concert_id: params[:id])
    else
      @usersconcert = UsersConcert.new
    end
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
