class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    top20 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&page=1")
    next20 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&page=2")
    @json1 = JSON.parse(top20.body, symbolize_names: true)
    @json2 = JSON.parse(next20.body, symbolize_names: true)
  end

  def search
    search = params[:search]
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=#{search}")
    json = JSON.parse(response.body, symbolize_names: true)
    @films = json[:results]
  end
end
