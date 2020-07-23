class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :birds

  def username
    self.email.split('@')[0]
  end
end
