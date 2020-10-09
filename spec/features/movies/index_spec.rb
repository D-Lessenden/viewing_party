require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movies page" do
    it "has a list of the top 40 movies" do

      json_response2 = File.read("spec/fixtures/next_20_movies.json")


      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=c74a8c939b809c17fcffb22fc6e5fd03&page=2").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
         'User-Agent'=>'Faraday v1.0.1'
          }).
        to_return(status: 200, body: json_response2)

      json_response1 = File.read("spec/fixtures/top_20_movies.json")

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=c74a8c939b809c17fcffb22fc6e5fd03&page=1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
         'User-Agent'=>'Faraday v1.0.1'
          }).
        to_return(status: 200, body: json_response1 )


        # expect(page).to have_button("Search by Movie Title")
        # expect(page).to have_content("Find a Movie Here")
    end
    # it "has a field to search for movies" do
    #   visit '/movies'
    #   expect(page).to have_button("Search by Movie Title")
    #   expect(page).to have_content("Find a Movie Here")
    #   # fill_in 'search', with: "Fight"
    #   # click_button "Search by Movie Title"
    #   # expect(current_path).to eq('/movies/search')
    # end
  end
end
