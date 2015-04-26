Rails.application.routes.draw do

  namespace :admin do
    resources :categories
    resources :users
  end

  resources :users
  resources :ideas


  get      '/login', to: 'sessions#new'
  post     '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
