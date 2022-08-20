class ConcertsController < ApplicationController
  before_action :set_concert, only: :show

  def index
    @concerts = Concert.all.order(created_at: :asc)
  end

  def show; end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end
end
