class Chatroom < ApplicationRecord
  belongs_to :concert, optional: true
  belongs_to :conversation, optional: true
  has_many :messages
  has_many :users, through: :messages

  def set_second_user(current_user)
    if conversation.host.id == current_user.id
      conversation.guest
    else
      conversation.host
    end
  end
end
