require 'rails_helper'

RSpec.describe "Show Page for a television show" do
  describe "when I visit a television show show page" do
    it "has the basic info for a show", :vcr do
      visit "/shows/#{76479}"
      expect(page).to have_content("Vote Average")
      expect(page).to have_content("Genre")
      expect(page).to have_content("Overview")
      expect(page).to have_content("Number of Seasons")
      expect(page).to have_content("Number of Episodes")
      expect(page).to have_content("Show Status")
    end
  end
end
