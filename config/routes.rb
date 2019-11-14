Rails.application.routes.draw do
  root to: 'sessions#home'

  get '/auth/:provider/callback', to: 'sessions#github_create'
  get 'auth/failure', to: redirect('/')

  resources :podcasts
  resources :users
end
