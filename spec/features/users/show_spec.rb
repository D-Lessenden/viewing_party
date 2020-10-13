require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  before :each do
    @user = User.create!(
                    username: 'USERNAME',
                    email: 'example@email.com',
                    password: 'Hunter2',
                    role: 0
                    )

    @friend = User.create!(
                    username: 'FRIEND',
                    email: 'friend@email.com',
                    password: 'Hunter2',
                    role: 0
                    )
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

      it "has a functional button for the Discover Movies button" do
        visit '/dashboard'
        click_button "Discover Movies"
        expect(current_path).to eq('/discover')
        expect(page).to have_content("Discover Your Next Favorite Movie!")
      end

      it "has a field where you can add a friend" do
        visit '/dashboard'
        fill_in :friend, with: 'friend@email.com'
        click_on 'Add Friend'
        #check to make sure table exists
        #check sad path.
        #add flashes to both 

      end
    end
end
