Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'events#index'

  resources :users
  resources :events
  resources :charges
end
