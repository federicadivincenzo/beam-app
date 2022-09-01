class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show
    @concerts = Concert.joins(:users_concerts).where('users_concerts.user_id = ?', @user.id).order(created_at: :asc)
    # line 6 needs refactoring.
    @reviews = Review.where(user_id: @user.id).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
