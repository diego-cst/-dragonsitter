Rails.application.routes.draw do
  get 'request_received/index'
  get 'request_sent/index'
  devise_for :users

  resources :dragons, only: [:index, :show]

  root to: 'pages#home'
  resources :profile, only: [:show]
end
