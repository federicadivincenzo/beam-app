class AddConversationToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :conversation, index: true, foreign_key: { to_table: :conversations }
  end
end
