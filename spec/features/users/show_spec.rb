# As an authenticated user,
# When I visit '/dashboard'
# I should see:
#
#  'Welcome <username>!' at the top of page
#  9 A button to Discover Movies
#  10 A friends section
#  11 A viewing parties section
require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  before :each do
    @user = User.create(
                    username: 'USERNAME',
                    email: 'example@email.com',
                    password: 'Hunter2',
                    role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
    describe 'As an authenticated user when I visit my dashboard' do
      it "has a welcome message, a button to discover movies, friend section, and a viewing party section" do
        visit '/dashboard'
        expect(page).to have_content("Welcome #{@user.username}!")
        expect(page).to have_button("Add Friend")
        expect(page).to have_button("Discover Movies")
      end
    end
end
