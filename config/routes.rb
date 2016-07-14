Rails.application.routes.draw do
  root to: 'homes#show'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
  resources :followers, only: [:index]
  resources :followings, only: [:index]
  resources :stars, only: [:index]

  get ':nickname_slug', to: 'users#show', as: :dashboard
end
