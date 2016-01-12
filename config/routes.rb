Rails.application.routes.draw do
  root 'root#welcome'

  get 'auth/github', as: :login
  get 'auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'users/data', defaults: {format: :json}
  resources :users, only: [:show]

  get '/explore', to: 'explore#index'
end
