class User < ApplicationRecord
  has_secure_password

  # validates_presence_of :email, :password, :username
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true

  has_many :following_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followed_users, foreign_key: :followed_id, class_name: 'Friendship'

  has_many :followers, through: :followed_users
  has_many :followed, through: :following_users
  
  has_many :parties
end

# enum role: ['default']
