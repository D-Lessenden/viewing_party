require 'rails_helper'

RSpec.describe User do

  describe 'Validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :username}
  end

  describe "relationships" do
    it {should have_many :following_users}
    it {should have_many(:followers).through(:following_users)}
    it {should have_many :followed_users}
    it {should have_many(:followed).through(:followed_users)}
  end
end
