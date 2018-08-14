Rails.application.routes.draw do

  devise_for :users, path: "accounts"
  root to: 'pages#home'

  resources :services do
    resources :bookings
  end

  get "dashboard", to: 'users#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

