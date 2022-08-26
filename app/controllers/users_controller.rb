class UsersController < ApplicationController
  def show
    @concerts = Concert.all.order(created_at: :asc)

  end
end
