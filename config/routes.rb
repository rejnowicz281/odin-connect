Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:edit, :update, :create, :destroy]
  end

  resources :friendships, only: [:create, :destroy]
  resources :invitations, only: [:new, :create, :destroy]

  devise_for :users
  resources :users, only: [:show]
  resources :profiles, except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
