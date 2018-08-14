Rails.application.routes.draw do
  devise_for :users

  resources :dragons, only: [:index, :show, :new, :create]
  resources :profile, only: [:show]
  resources :booking, only: [:new, :create]

  root to: 'pages#home'
end
