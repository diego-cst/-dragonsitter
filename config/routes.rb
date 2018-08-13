Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profile, only: [:show, :edit, :update]
end
