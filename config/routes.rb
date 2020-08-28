Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'posts#index'
  resources :users  
  resources :posts

  get 'users/:id/posts' => 'users#posts', :as => :user_posts
end
