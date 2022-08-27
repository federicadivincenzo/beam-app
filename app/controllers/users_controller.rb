class UsersController < ApplicationController
  def show
    @concerts = Concert.all.order(created_at: :asc)
    @username = current_user.username
    @userphto = current_user.photo
    # @reviewContent = Review.first.content
    @reviewRating = Review.first.rating
  end
end
