class ConcertsController < ApplicationController

  def index
    @concerts = Concert.all.order(created_at: :asc)
  end
end
