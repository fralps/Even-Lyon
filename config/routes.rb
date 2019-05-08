Rails.application.routes.draw do
  get 'attendances/index'
  get 'users/show'
  devise_for :users
  root to: 'events#index'

  resources :users
  resources :events
  resources :charges
  resources :attendances

  post 'create_attendance' => 'attendances#create', as: :create_attendance
end
