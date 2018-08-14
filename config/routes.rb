Rails.application.routes.draw do
  devise_for :users

  resources :dragons, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :profile, only: [:show]
  resources :bookings, only: [:show]

  root to: 'pages#home'
end
