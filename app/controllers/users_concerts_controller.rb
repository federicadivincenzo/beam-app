class UsermodelsController < ApplicationController
  before_action :set_concert, only: %i[attending? create]

  def create
    @usermodel = UserModel.new(usermodel_params)
    @usermodel.concert_id = @concert.id
    @usermodel.user_id = current_user.id
    @usermodel.save
  end

  def attending?
    current_user.id == UserModel.user_id && UserModel.concert_id == @concert.id
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def usermodel_params
    params.require(:usermodel).permit(:concert_id, :user_id)
  end
end
