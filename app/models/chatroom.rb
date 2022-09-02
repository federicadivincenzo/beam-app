class Chatroom < ApplicationRecord
  belongs_to :concert
  has_many :messages
  has_many :users, through: :messages
end
