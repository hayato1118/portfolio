Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users
  resources :orders
  resources :carts
  resources :products do
    resource :product_carts, only: [:create,:destroy]
  end
  resources :homes
  get 'homes/question'
  get 'homes/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

