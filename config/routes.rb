Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  resources :universities

  devise_for :users, path: "accounts"
  resources :users, only: [:index]
  root to: 'pages#home'

  resources :services do
    resources :bookings, except: [:destroy] do
      patch "/accept", to: "bookings#accept"
      patch "/decline", to: "bookings#decline"
      patch "/completed", to: "bookings#completed"
      resources :reviews, only: [:new, :create]
    end
    get "index", to: "reviews#index", as: "reviews_index"
  end

  resources :categories

  get "dashboard", to: 'users#dashboard', as: 'dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :services
end
