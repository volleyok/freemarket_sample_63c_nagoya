Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :mypages, only: [:index, :show]
end
