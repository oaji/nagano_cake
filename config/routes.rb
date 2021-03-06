Rails.application.routes.draw do

    root :to => 'customers/top#top'
    get 'customers/top/about'

    devise_for :admins, skip: :all #これに上のdevise_forを消して、書き換える
    devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new'
    post '/admins/sign_in' => 'admins/sessions#create'
    delete '/admins/sign_out' => 'admins/sessions#destroy'
    end

    devise_for :customers, skip: :all #下部に定義しているルーティング以外消す技
    devise_scope :customer do
    get '/customers/sign_up' => 'customers/registrations#new'
    post '/customers/sign_up' => 'customers/registrations#create'
    get '/customers/sign_in' => 'customers/sessions#new'
    post '/customers/sign_in' => 'customers/sessions#create'
    delete '/customers/sign_out' => 'customers/sessions#destroy'
    end

    namespace :admin do
      resources :orders,only:[:index, :show, :update]
      resources :customers,only:[:index, :show, :edit, :update]
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      resources :genres, only: [:edit, :index, :create, :update]
      get 'admins/top' => 'admins/top'
      resources :order_items, only: [:update]

    end

    scope module: :customers do

      resources :addresses, only: [:index, :create, :destroy, :edit, :update]

      resources :cart_items,only: [:index, :create, :update, :destroy]
      delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'

      post 'orders/confirm'
      get 'orders/complete'
      resources :orders, only: [:new, :create, :index, :show]


      resources :items, only: [:index, :show]
      get 'items/search/:genre_id' => 'items#search', as: 'search'

      resource :customers
      get '/customers/hide' => 'customers#hide'
      patch '/customers/complete' => 'customers#complete'


    end


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
