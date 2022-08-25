class Concert < ApplicationRecord
  has_one :chatroom
  has_many :users
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
