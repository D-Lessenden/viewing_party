require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movies page" do
    it "has a field to search for movies" do
      visit '/movies'
      expect(page).to have_button("Search by Movie Title")
      expect(page).to have_content("Find a Movie Here")
      fill_in 'search', with: "Fight"
      click_button "Search by Movie Title"
      expect(current_path).to eq('/movies/search')
      save_and_open_page
    end
  end
end
