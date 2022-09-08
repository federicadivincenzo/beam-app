class ReviewsController < ApplicationController
  before_action :set_user_being_reviewed, only: %i[create new]

  def home; end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.review_profile_id = @reviewed_user.id
    redirect_to user_path(@reviewed_user)
  end

  def new
    @review = Review.new
  end

  private

  def set_user_being_reviewed
    @reviewed_user = User.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :review_profile_id)
  end
end
