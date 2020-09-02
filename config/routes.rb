Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts
end
