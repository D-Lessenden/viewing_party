class ShowsController < ApplicationController
  def index
    render file: '/public/404' if current_user.nil?

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    top20 = conn.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1")
    next20 = conn.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2")
    @json1 = JSON.parse(top20.body, symbolize_names: true)
    @json2 = JSON.parse(next20.body, symbolize_names: true)
  end
end
