Rails.application.routes.draw do
  resources :tasks
  root to: 'tasks#index'
  resources :users, only: [:new,:create,:show]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
end
