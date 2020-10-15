class PartiesController < ApplicationController
  before_action :require_login

  def index; end

  def new
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIE_API_KEY']}")
    @film = JSON.parse(response.body, symbolize_names: true)
    @party = Party.new
  end

  def create
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['API-Key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIE_API_KEY']}")
    @film = JSON.parse(response.body, symbolize_names: true)
    party = Party.create({
                           movie_title: @film[:original_title],
                           duration: params[:duration],
                           date: params[:date],
                           start_time: params[:start_time],
                           user_id: current_user.id
                         })

    if party.save
      flash[:success] = 'Nice! New Party Created!'
      redirect_to '/dashboard'
    else
      flash[:errors] = party.errors.full_messages.to_sentence
      render :new
    end
  end
end
