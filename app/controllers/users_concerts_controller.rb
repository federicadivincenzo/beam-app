class UsersConcertsController < ApplicationController
  before_action :set_concert, only: %i[attending? create]
  before_action :set_user, only: %i[create]

  def create
    @usersconcert = UsersConcert.new
    @usersconcert.concert_id = @concert.id
    @usersconcert.user_id = @user.id
    @usersconcert.save
    render 'concerts/show'
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def set_user
    @user = current_user
  end

  # def users_concert_params
  #   params.require(:users_concert).permit(:concert_id, :user_id)
  # end
end
