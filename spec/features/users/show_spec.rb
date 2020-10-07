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
        expect(page).to have_content("You currently have no friends.")
      end
    end
end
