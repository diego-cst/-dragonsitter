Rails.application.routes.draw do
  devise_for :users

  resources :dragons, only: [:index, :show, :new, :create, :destroy]

  root to: 'pages#home'
  resources :profile, only: [:show]
end
