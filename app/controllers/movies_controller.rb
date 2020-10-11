class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["API-Key"] = 'c74a8c939b809c17fcffb22fc6e5fd03'
    end
    top20 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=c74a8c939b809c17fcffb22fc6e5fd03&page=1")
    next20 = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=c74a8c939b809c17fcffb22fc6e5fd03&page=2")
    @json1 = JSON.parse(top20.body, symbolize_names: true)
    @json2 = JSON.parse(next20.body, symbolize_names: true)
  end

  def search
    @search = params[:search]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["API-Key"] = 'c74a8c939b809c17fcffb22fc6e5fd03'
    end
    response = conn.get("/3/search/movie?api_key=c74a8c939b809c17fcffb22fc6e5fd03&query=#{@search}")
    json = JSON.parse(response.body, symbolize_names: true)
    @films = json[:results]
  end

  def show
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["API-Key"] = 'c74a8c939b809c17fcffb22fc6e5fd03'
    end
    response = conn.get("/3/movie/#{params[:id]}?api_key=c74a8c939b809c17fcffb22fc6e5fd03")
    cast_response = conn.get("/3/movie/#{params[:id]}/credits?api_key=c74a8c939b809c17fcffb22fc6e5fd03")
    review_response = conn.get("/3/movie/#{params[:id]}/reviews?api_key=c74a8c939b809c17fcffb22fc6e5fd03&language=en-US")
    @json = JSON.parse(response.body, symbolize_names: true)
    @cast = JSON.parse(cast_response.body, symbolize_names: true)
    @reviews = JSON.parse(review_response.body, symbolize_names: true)
  end

end
