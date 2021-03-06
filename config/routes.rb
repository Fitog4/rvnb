Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'dashboard_previous', to: 'pages#dashboard_previous', as: 'dashboard_previous'
  get 'dashboard_rv_requests', to: 'pages#dashboard_rv_requests', as: 'dashboard_rv_requests'
  get 'dashboard_rv_previous_requests', to: 'pages#dashboard_prev_reqs_for_my_rvs', as: 'dashboard_rv_previous_requests'
  get 'rvs/filter', to: 'rvs#filter_by_date'
  resources :rvs, only: [ :new, :create, :show, ] do
    resources :booking_requests, only: [ :new, :show, :create ]
  end
  get 'rvs', to: 'rvs#search'
  devise_for :users
  resources :users, only: [ :show ]
end
