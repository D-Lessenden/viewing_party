class MoviesController < ApplicationController
  def index
  end

  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["API-Key"] = 'c74a8c939b809c17fcffb22fc6e5fd03'
    end

  end
end
