Rails.application.routes.draw do
  root to: 'sessions#home'

  get '/auth/github/callback', to: 'sessions#github_create'
  get '/auth/google_oauth2/callback', to: 'sessions#google_create'
  get '/auth/twitter/callback', to: 'sessions#twitter_create'
  get 'auth/failure', to: redirect('/')

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  post '/login' => 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/all', to: 'podcasts#index', as: 'all'
  resources :users
end
