class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :password, :username

  has_many :following_users, foreign_key: :follower_id, class_name: "Friendship"
  has_many :followers, through: :following_users

  has_many :followed_users, foreign_key: :followed_id, class_name: "Friendship"
  has_many :followed, through: :followed_users
end





# validates :email, presence: true
# validates :password, presence: true

# enum role: ['default']
