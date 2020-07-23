class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :birds
  has_many :friendships
  has_many :friends, through: :friendships

  def username
    email.split('@').first
  end

  def exists_friendship?(friend_id)
    Friendship.exists?(user_id: id, friend_id: friend_id)
  end
end
