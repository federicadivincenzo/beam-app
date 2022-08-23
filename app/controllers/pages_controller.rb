class PagesController < ApplicationController
  def home
    # @concerts = Concerts.all
    @concerts = Concert.all.order(created_at: :asc)
  end
end
