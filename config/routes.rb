Rails.application.routes.draw do

 devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}


  devise_for :users, controllers: {
sessions: 'users/sessions',
passwords: 'users/passwords',
registrations: 'users/registrations'
}

namespace :admins do
  resources :users
  resources :products
end

  resources :users
  resources :users do
    member do
     get :following, :followers
    end
  end

  get 'users/favorite/:id' => 'users#favorite', as: 'user_favorite'
  get 'users/history/:id' => 'users#history', as: 'user_history'
  get 'users/sale/:id' => 'users#sale', as: 'user_sale'

  resources :relationships, only: [:create, :destroy]
  resources :orders
  resources :carts
  resources :products do
    resource :product_carts, only: [:create,:destroy]
    resource :product_comments, only: [:create, :destroy]
    member do #本一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
  end
  end
  #個人ページからお気に入りを削除する
  resources :favorites, only: [:destroy]

  resources :homes
  get 'homes/question'
  get 'homes/contact'

  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

