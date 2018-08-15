Rails.application.routes.draw do
  get 'request_received/index'
  get 'request_sent/index'
  devise_for :users

  resources :dragons do
    resources :bookings, only: [:new, :create]
  end
  resources :profile, only: [:show]
  resources :bookings, only: [:show] do
    post '/confirm', to: "update_status#confirm_booking", as: :confirm_booking
    post '/refuse', to: "update_status#refuse_booking", as: :refuse_booking
  end
  root to: 'pages#home'
end
