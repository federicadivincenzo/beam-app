class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  # skip_before_action :verify_authenticity_token

  def index
    @chatrooms = Chatroom.all
    @current_user = current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = Message.where(chatroom_id: params[:id])
  end
end
