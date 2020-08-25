Rails.application.routes.draw do
  get 'home/index'
  # root to: 'home#index'
  resources :users, only: [:index, :show]
end
