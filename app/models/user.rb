class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :password, :username
  # validates :email, presence: true
  # validates :password, presence: true

  # enum role: ['default']
end
