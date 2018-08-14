Rails.application.routes.draw do

  resources :categories do
    resources :skills
  end

  resources :services do
    resources :bookings do
      resources :reviews, only: [:new, :create]
    end
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/create'
  # get 'categories/edit'
  # get 'categories/update'
  # get 'categories/destroy'
  # get 'skills/index'
  # get 'skills/show'
  # get 'skills/new'
  # get 'skills/create'
  # get 'skills/edit'
  # get 'skills/update'
  # get 'skills/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/destroy'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/destroy'
  # get 'services/show'
  # get 'services/index'
  # get 'services/new'
  # get 'services/create'
  # get 'services/edit'
  # get 'services/update'
  # get 'services/destroy'
