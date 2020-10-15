require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
  describe 'As an authenticated user when i visit the movie detail page' do
    it 'has a button to create a viewing party' do
      show_film = File.read("spec/fixtures/show_individual_film.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=c74a8c939b809c17fcffb22fc6e5fd03").
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
           'User-Agent'=>'Faraday v1.0.1'
            }).
          to_return(status: 200, body: show_film, headers: {})


      credits = File.read("spec/fixtures/show_credits.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=c74a8c939b809c17fcffb22fc6e5fd03").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
         'User-Agent'=>'Faraday v1.0.1'
          }).
        to_return(status: 200, body: credits, headers: {})

      reviews = File.read("spec/fixtures/show_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=c74a8c939b809c17fcffb22fc6e5fd03&language=en-US").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Api-Key'=>'c74a8c939b809c17fcffb22fc6e5fd03',
         'User-Agent'=>'Faraday v1.0.1'
          }).
      to_return(status: 200, body: reviews, headers: {})


       visit "/movies/#{550}"
       expect(page).to have_link("Create Viewing Party for Movie", href: "/movies/#{550}/parties/new")
       expect(page).to have_content("Vote Average")
       expect(page).to have_content("Runtime")
       expect(page).to have_content("Genre(s)")
       expect(page).to have_content("Summary")
       expect(page).to have_content("Cast")
       expect(page).to have_content("Reviews")
    end
  end
end
