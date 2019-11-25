Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :mypages, only: [:index, :show]
end
