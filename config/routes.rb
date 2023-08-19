Rails.application.routes.draw do
  # get 'rooms/index'
  devise_for :users
  resources :users
  mount ActionCable.server => '/cable'
  # get "profiles", to: "profiles#index"
  get "/search", to: "search#index"
  get "/agent/:id", to: "home#agent"
  get "/new_password", to: "profiles#change_password"
  get "/my_properties", to: "profiles#my_properties"
  get "/my_account", to: "profiles#my_account"
  post "/reset_password", to: "profiles#reset_password"
  # get "/properties/new", to: "properties#new"
  resources :profiles
  resources :properties
  resources :posts
  resources :rooms
  resources :rooms do
    resources :messages
  end
  get "/get_msg", to: "rooms#get_msg"

  # get "properties/:id", to: "properties#show", as: "property"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    root "dashboard#index"
    resources :companies
    resources :users
    resources :properties
    resources :users
    # get "properties", to: "properties#index"
  end
end
