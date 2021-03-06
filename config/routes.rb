Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'search'
      get 'category' 
      get 'category_list'
    end
  end
  namespace :api do
    resources "posts", controller: :posts, only: :child, defaults: { format: 'json' } do
      collection do
        get 'child'
      end
    end
    resources "posts", controller: :posts, only: :grand_child, defaults: { format: 'json' } do
      collection do
        get 'grand_child'
      end
    end

  end

  resources :mypages, only: [:index,:edit, :update, :destroy, :show] do
    collection do
      get 'delete'
      get 'profile'
      get 'address'
      get 'card'
      get 'password'
      get 'identification'
      get 'confirmation'
      get 'post_detail'
      get 'post_sold'
    end
    end
  resources :buy_order, only: :show
  resources :buy_order_confirmations, only: :show 
  resources :signups do
    collection do
      get 'show'
      get 'new'
      get 'phone'
      get 'address'
      get 'check'
      get 'complete' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :likes, only: [:create, :destroy]
end
