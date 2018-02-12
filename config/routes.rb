Rails.application.routes.draw do
  devise_for :users, controllers: {
sessions: 'users/sessions',
passwords: 'users/passwords',
registrations: 'users/registrations'
}

  resources :users
  resources :orders
  resources :carts
  resources :products do
    resource :product_carts, only: [:create,:destroy]
    resource :product_comments, only: [:create, :destroy]
  end
  
  resources :homes
  get 'homes/question'
  get 'homes/contact'

  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

