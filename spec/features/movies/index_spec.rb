require 'rails_helper'

RSpec.describe "Movies Page as an authenticated user" do

  it "displays 40 movies with their title and vote average", :vcr do

    visit "/movies"

    expect(page).to have_content("Top 40 Movies")
    expect(page).to have_button("Search by Movie Title")
    expect(page).to have_button("Find Top Rated Movies")
    expect(page).to have_link("The Godfather")
    expect(page).to have_content("Vote Average:")
  end
end
