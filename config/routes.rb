Rails.application.routes.draw do
  root 'home#index'
  resources :posts
  resources :comments

  devise_for :users
end
