require 'rails_helper'

RSpec.describe User do

  describe 'Validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :username}
  end

  describe "relationships" do
    it {should have_many :following_users}
    it {should have_many(:followers).through(:followed_users)}
    it {should have_many :followed_users}
    it {should have_many(:followed).through(:following_users)}
  end

  describe 'friendships' do
    let!(:user) { User.create(email: '123', password: '123', username: 'user')}
    let!(:follower_user) { User.create(email: '456', password: '456', username: 'follower')}
    let!(:follow_user) { User.create(email: '456', password: '456', username: 'follower')}
    let!(:friendship_follower) { Friendship.create(follower: follower_user, followed: user )}
    let!(:friendship_followed) { Friendship.create(follower: user, followed: follow_user )}
  end
end
