Rails.application.routes.draw do
  root 'root#welcome'

  get 'auth/github', as: :login
  get 'auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'users/:id/repo_data', to: 'users#repo_data', defaults: {format: :json}
  get 'users/:id/follower_data', to: 'users#follower_data', defaults: {format: :json}
  get 'users/:id/user_data', to: 'users#user_data', defaults: {format: :json}
  get '/explore', to: 'explore#index'

  resources :users, only: [:show]
end
