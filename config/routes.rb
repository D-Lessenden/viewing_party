Rails.application.routes.draw do

  root to: "welcome#index"

  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/movies/:id/parties/new', to: 'parties#new'
  post '/movies/:id/parties', to: 'parties#create'

  get '/movies/search', to: 'movies#search'
  resources :movies, :only => [:index, :show]
  resources :discover, :only => [:index]

  get '/', to: 'sessions#new'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
