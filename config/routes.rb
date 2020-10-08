Rails.application.routes.draw do

  root to: "welcome#index"

  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/', to: 'sessions#new'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
