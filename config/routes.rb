Rails.application.routes.draw do
  root 'root#welcome'

  get 'auth/github', as: :login
  get 'auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :followers, only: [:index, :show]
end
