require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movie search page" do
    it "has a field to search for movies" do

      search_response = File.read('spec/fixtures/search_result_fight.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=c74a8c939b809c17fcffb22fc6e5fd03&query=fight").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
         'User-Agent'=>'Faraday v1.0.1'
          }).
        to_return(status: 200, body: search_response)
    end
  end
end
