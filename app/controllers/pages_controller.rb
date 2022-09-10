class PagesController < ApplicationController
  def home
    @concerts = Concert.all.order(date: :asc)
  end
end
