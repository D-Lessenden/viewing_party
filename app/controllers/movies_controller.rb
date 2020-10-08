class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-Key"] = 'c74a8c939b809c17fcffb22fc6e5fd03'
    end
  end

  #x-api-key=>ENV['PROPUBLICA_API_KEY']



end
