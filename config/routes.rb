Rails.application.routes.draw do
  devise_for :users
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
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  get 'search' => 'searches#search'
  
  get 'spots/index' => 'spots#index'

  resources :spots, only: [:index]
  #get 'users/my_page' => 'users#show'
  #get 'users/information/edit' => 'users#edit'
  #patch 'users/information' => 'users#update'
  #get 'users/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
