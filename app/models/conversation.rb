class Conversation < ApplicationRecord
  has_one :chatroom
  belongs_to :host, class_name: 'User'
  belongs_to :guest, class_name: 'User'

  after_create :set_chatroom

  private

  def set_chatroom
    Chatroom.create!(name: "#{host.username} --- #{guest.username}", conversation_id: id, private: true)
  end
end
