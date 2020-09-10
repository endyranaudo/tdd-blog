Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'posts#index'
  # PROTECTED ROUTES
  authenticated :user do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:index, :show]
  resources :posts
end
