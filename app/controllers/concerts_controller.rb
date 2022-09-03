class ConcertsController < ApplicationController
  before_action :set_concert, only: :show

  def index
    @fav_concerts = Concert.all.sample(4)
    @concerts = if params[:query].present?
                  Concert.search_by_artist_address_venue_genre_description(params[:query])
                else
                  Concert.all.order(created_at: :asc)
                end
  end

  def show
    @usersconcert = if UsersConcert.exists?(concert_id: params[:id])
                      UsersConcert.find_by(concert_id: params[:id])
                    else
                      UsersConcert.new
                    end
    @attendees = UsersConcert.where(concert_id: params[:id])
  end

  def attendees
    UsersConcert.where(concert_id: params[:id]).count
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
