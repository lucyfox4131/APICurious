Rails.application.routes.draw do
  get 'sessions/create'

  get 'homes/show'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
  root to: 'homes#show'
end
