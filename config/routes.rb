Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  # PROTECTED ROUTES
  authenticate :user do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:index, :show]
  resources :posts
end
