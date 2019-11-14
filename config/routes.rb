Rails.application.routes.draw do
  root to: 'sessions#home'
  resources :podcasts
  resources :users
end
