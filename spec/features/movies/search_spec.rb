require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movie search page" do
    it "has a field to search for movies", :vcr do
      @user = User.create!(
                      username: 'USERNAME',
                      email: 'example@email.com',
                      password: 'Hunter2',
                      role: 0
                      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/movies'
      expect(page).to have_button("Search by Movie Title")
      fill_in :search, with: 'fight'
      click_on 'Search by Movie Title'
      expect(current_path).to eq('/movies/search')
    end
  end
end
