class UsersConcert < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one_attached :photo

  def attending?(concert, current_user)
    current_user.id == user_id && concert_id == concert.id
  end
end
