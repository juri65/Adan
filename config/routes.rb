Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "homes#top"
  resources :posts, only: [:new,:create, :show, :edit, :update, :index, :destroy] do
    resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
   end 
  resources :users, only: [:create, :show, :edit, :update, :index, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
   end
   # 退会確認画面
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
  patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  
  get 'search' => 'searches#search'
  
  get 'spots/index' => 'spots#index'
   # 地図
  resources :spots, only: [:index]
   # 通知
  resources :notifications, only: :index
   # グループ
  resources :groups, only: [:index, :show, :new, :create, :edit, :update,:destroy] do
      get "join" => "groups#join"
       delete "all_destroy" => 'groups#all_destroy'
      post :invitation
  end 
end
