require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "When I visit the '/discover' path" do
    it "should have a button to discover top 40 movies" do
      visit '/discover'
      expect(page).to have_button("Discover Top 40")
      click_button "Discover Top 40"
      expect(current_path).to eq('/movies')
      expect(page).to have_button("Search by Movie Title")
      click_button "Search by Movie Title"
    end
  end
end
