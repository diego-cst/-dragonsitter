Rails.application.routes.draw do
  devise_for :users

  resources :dragons, only: [:index]

  root to: 'pages#home'
  resources :profile, only: [:show]
end
