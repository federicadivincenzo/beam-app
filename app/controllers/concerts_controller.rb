class ConcertsController < ApplicationController
  before_action :set_concert, only: :show

  def index
    if params[:query].present?
      @concerts = Concert.search_by_artist_address_venue_and_description(params[:query])
    else
      @concerts = Concert.all.order(created_at: :asc)
    end
  end

  def show; end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
