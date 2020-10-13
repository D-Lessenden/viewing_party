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
    @search = params[:search]
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=#{@search}")

    json = JSON.parse(response.body, symbolize_names: true)
    @films = json[:results]
  end

  def show
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["API-Key"] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIE_API_KEY']}")
    cast_response = conn.get("/3/movie/#{params[:id]}/credits?api_key=#{ENV['MOVIE_API_KEY']}")
    review_response = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US")
    @json = JSON.parse(response.body, symbolize_names: true)
    cast = JSON.parse(cast_response.body, symbolize_names: true)
    @first_10_cast = cast[:cast].first(10)
    @reviews = JSON.parse(review_response.body, symbolize_names: true)
  end

end
