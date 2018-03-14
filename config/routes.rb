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
        resources :orders
        resources :contacts
    end

    resources :users
    resources :users do
        member do
            get :following, :followers
        end
    end

    get 'users/:id/favorite' => 'users#favorite', as: 'user_favorite'
    get 'users/:id/history' => 'users#history', as: 'user_history'
    get 'users/:id/sale' => 'users#sale', as: 'user_sale'
    get 'orders/:id/sold' => 'orders#sold', as: 'order_sold'


    resources :relationships, only: [:create, :destroy]
    resources :orders

    post 'orders/pay' => 'orders#pay'

    get 'orders/:id/complete' => 'orders#complete', as: 'order_complete'

    #個人ページからお気に入りを削除する
    resources :mypage_comments, only: [:create, :destroy]
    resources :favorites, only: [:destroy]
    resources :carts
    resources :tags


    resources :products do
        collection do
            post 'confirm'
        end
        resource :product_carts, only: [:create,:destroy,:update]
        resources :product_comments, only: [:create, :destroy]
        resources :product_goods, only: [:create, :destroy]
            member do #本一覧画面からお気に入り登録をする
                post "add", to: "favorites#create"
        end
    end
    get 'products/:id/complete' => 'products#complete', as: 'product_complete'

    resources :contacts do
            collection do
            post 'confirm'
        end
    end
    get 'contacts/:id/complete' => 'contacts#complete', as: 'contact_complete'

    resources :homes do
        # collection do
        #         post 'confirm'
        #     end
        end

    root 'homes#index'

end

