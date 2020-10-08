Rails.application.routes.draw do

  root to: "welcome#index"

  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  #resources :movies, :only => [:index]
  get '/discover', to: 'movies#index'
  get '/movies', to: 'movies#search'

end
