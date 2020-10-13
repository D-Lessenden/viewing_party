require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I visit the movie search page" do
    it "has a field to search for movies" do

      search_response = File.read('spec/fixtures/search_result_fight.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=fight").
        with(
          headers: {
         'Api-Key'=>ENV['MOVIE_API_KEY']
          }).
        to_return(status: 200, body: search_response)
    end
  end
end
