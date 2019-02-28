Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :rvs, only: [ :new, :create, :show, ] do
    resources :booking_requests, only: [ :new, :show, :create ]
  end
  get 'rvs', to: 'rvs#search'
  devise_for :users
  resources :users, only: [ :show ]
  resources :booking_requests, only: [:index]
end
