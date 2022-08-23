class Concert < ApplicationRecord
  has_one :chatroom
  has_many :users
end
