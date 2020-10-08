require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movies page" do
    it "has a field to search for movies" do
      visit '/movies'
      expect(page).to have_button("Search by Movie Title")
      click_button "Search by Movie Title"
    end
  end
end
