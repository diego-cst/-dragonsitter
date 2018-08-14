Rails.application.routes.draw do
  get 'request_received/index'
  get 'request_sent/index'
  devise_for :users

  resources :dragons do
    resources :bookings, only: [:new, :create]
  end
  resources :profile, only: [:show]
  resources :bookings, only: [:show]

  root to: 'pages#home'
end
