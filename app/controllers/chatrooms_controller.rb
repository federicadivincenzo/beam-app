class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  # skip_before_action :verify_authenticity_token
  def show
    @chatroom = Chatroom.find(params[:id]).includes(:message)
    @message = Message.new.includes(:user)
  end
end
