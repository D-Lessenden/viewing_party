Rails.application.routes.draw do

  root to: "welcome#index"

  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  resources :movies, :only => [:index]
  get '/movies/search', to: 'movies#search'
  resources :discover, :only => [:index]

  get '/', to: 'sessions#new'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get "/movies/:id", to: 'movies#show' 

end
