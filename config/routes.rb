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
    end
    end
  resources :buy_order, only: :show
  resources :buy_order_confirmations, only: :show 
  resources :signups do
    collection do
      get 'new'
      get 'phone'
      get 'address'
      get 'check'
      get 'complete' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end

end
