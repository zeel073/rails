# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :new_users
  root 'students#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :students do
    resources :reviews do
      get 'preview', on: :member
    end
  end
  get 'home', to: 'students#new', as: 'home'
  #  resources :learnings
  namespace :tutorial do
    resources :learnings
  end
  resources :users do
    resources :userdetails
  end

  # authenticate :student do
  # Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  #   username == 'zeel' && password == 'patel'
  # end
  mount Sidekiq::Web => '/sidekiq'
  # end
  # Defines the root path route ("/")
  # root "articles#index"
end
