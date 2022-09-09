class User < ApplicationRecord
  has_many :user_concerts
  has_many :concerts, through: :users_concerts
  has_many :review_profiles
  has_many :reviews, through: :review_profiles
  has_many :reviews
  has_many :host_conversations, class_name: 'Conversation', foreign_key: 'host_id'
  has_many :guest_conversations, class_name: 'Conversation', foreign_key: 'guest_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :chatrooms, through: :messages
end
