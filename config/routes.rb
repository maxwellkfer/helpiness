Rails.application.routes.draw do

  resources :conversations do
    resources :messages
   end

  resources :universities

  devise_for :users, path: "accounts"
  root to: 'pages#home'

  resources :services do
    resources :bookings do
      patch "/accept", to: "bookings#accept"
      patch "/decline", to: "bookings#decline"
    end
  end

  get "dashboard", to: 'users#dashboard', as: 'dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

