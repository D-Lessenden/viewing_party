require 'rails_helper'

RSpec.describe "As an user" do
  describe "When I visit the '/discover' path as a non-authenticated user" do
    it "has a 404 error" do
      visit '/discover'
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe "When I visit the '/discover' path as an authenticated user" do
    it "should have a button to discover top 40 movies", :vcr do
      @user = User.create!(
                      username: 'USERNAME',
                      email: 'example@email.com',
                      password: 'Hunter2',
                      role: 0
                      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/discover'
      expect(page).to have_button("Discover Top 40 Movies")
      click_on "Discover Top 40 Movies"
      expect(current_path).to eq('/movies')
    end

    it "should have a button to discover top 40 Shows", :vcr do
      @user = User.create!(
                      username: 'USERNAME',
                      email: 'example@email.com',
                      password: 'Hunter2',
                      role: 0
                      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/discover'
      expect(page).to have_button("Discover Top 40 Shows")
      click_on "Discover Top 40 Shows"
      expect(current_path).to eq('/shows')
    end
  end
end
