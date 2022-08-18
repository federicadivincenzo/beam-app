class Review < ApplicationRecord
  belongs_to :user
  belongs_to :review_profile
end
