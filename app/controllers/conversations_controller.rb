class ConversationsController < ApplicationController
  before_action :set_variables, only: %i[create]

  def create
    @conversation = Conversation.create!(host_id: @host.id, guest_id: @guest.id) if @conversation.nil?
    redirect_to chatroom_path(@conversation.chatroom)
  end


  private

  def set_variables
    @guest = User.find(params[:user_id])
    @host = User.find(current_user.id)
    @conversation = Conversation.find_by(host_id: @host.id, guest_id: @guest.id) || Conversation.find_by(host_id: @guest.id, guest_id: @host.id)
  end


end
