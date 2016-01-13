Rails.application.routes.draw do
  root 'root#welcome'

  get 'auth/github', as: :login
  get 'auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'users/repo_data', defaults: {format: :json}
  get 'users/follower_data', defaults: {format: :json}
  get '/explore', to: 'explore#index'

  resources :users, only: [:show]
end
