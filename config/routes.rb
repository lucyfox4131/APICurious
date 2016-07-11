Rails.application.routes.draw do
  get 'homes/show'

  get '/auth/github', as: :github_login
  get 'auth/github/callback', to: 'sessions#create'
  root to: 'homes#show'
end
