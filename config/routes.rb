Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # IS IT THAT REDUNDANT???
  authenticated :user do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :users, only: [:index, :show]
  resources :posts
end
