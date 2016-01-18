Rails.application.routes.draw do
  root 'root#welcome'

  get 'auth/github', as: :login
  get 'auth/github/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'explore#search'

  get 'users/:user_id/repos/:id/specific_repo_data', to: 'repos#specific_repo_data', defaults: {format: :json}
  get 'users/:user_id/repos/:id/language_data', to: 'repos#language_data', defaults: {format: :json}
  get 'users/:user_id/repos/:id/commit_data', to: 'repos#commit_data', defaults: {format: :json}
  get 'users/:user_id/repos/:id/commit_activity', to: 'repos#commit_activity', defaults: {format: :json}
  get 'users/:user_id/repos/:id/contributor_data', to: 'repos#contributor_data', defaults: {format: :json}

  get 'users/:id/repo_data', to: 'users#repo_data', defaults: {format: :json}
  get 'users/:id/follower_data', to: 'users#follower_data', defaults: {format: :json}
  get 'users/:id/user_data', to: 'users#user_data', defaults: {format: :json}

  get '/explore', to: 'explore#index'

  resources :users, only: [:show] do
    resources :repos, only: [:index, :show]
  end
end
