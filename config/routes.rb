Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :mypages, only: [:index, :show]
  resources :buy_order, only: :show
  resources :buy_order_confirmations, only: :show 
end
