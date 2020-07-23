class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :birds
  has_many :friendships
  has_many :friends, through: :friendships

  def username
    self.email.split('@')[0]
  end
end
