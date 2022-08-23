class UserModel < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one_attached :photo
end
