Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/edit'
  get 'posts/index'
  get 'posts/new'
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
