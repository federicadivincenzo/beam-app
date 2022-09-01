class Chatroom < ApplicationRecord
  belongs_to :concert
  has_many :messages
end
