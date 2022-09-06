class UsersConcertsController < ApplicationController
  before_action :set_concert, only: %i[attending? create]
  before_action :set_user, only: %i[create]

  def create
    @usersconcert = UsersConcert.new(users_concert_params)
    @usersconcert.concert = @concert
    @usersconcert.user = @user
    @usersconcert.save
    redirect_to concert_path(@concert)
  end

  def count
    UsersConcert.where(concert_id: params[:id]).count
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def set_user
    @user = current_user
  end

  def users_concert_params
    params.permit(:concert_id, :user_id)
  end
end
