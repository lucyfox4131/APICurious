Rails.application.routes.draw do
  get 'users/show'

  root to: 'homes#show'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  get ':nickname_slug', to: 'users#show', as: :dashboard
end
