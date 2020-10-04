Rails.application.routes.draw do

  root :to => 'customers/top#top'
  get 'customers/top/about'

  # devise_for :admins, controllers: {
  # sessions:      'admins/sessions',
  # passwords:     'admins/passwords',
  # registrations: 'admins/registrations'
  # }

  # devise_for :customers, controllers: {
  # sessions:      'customers/sessions',
  # passwords:     'customers/passwords',
  # registrations: 'customers/registrations'
  # }

  devise_for :admins, skip: :all #これに上のdevise_forを消して、書き換える
  devise_scope :admin do
  get '/admins/sign_in' => 'admins/registrations#new'
  post '/admins/sign_in' => 'admins/registrations#create'
  get '//admins/sign_out' => 'admins/sessions#destroy'
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
    get 'admins/top' => 'admins/top' #右側抜けてた
  end



  scope module: :customers do
  resources :addresses, only: [:index, :destroy, :edit, :update]
  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/confirm'
  get 'orders/complete'
  get 'items/search/:genre_id' => 'items#search', as: 'search'
  resources :cart_items, only: [:index, :create, :edit, :update]
  resources :items, only: [:index, :show]
  resource :customers
  # get '/customer/edit/' => 'customers#edit', as: 'edit_customer'  ◀︎deviseのパス変更したら消す。
  # get '/customer' => 'customers#show',as: 'customer'
  get '/customers/hide' => 'customers#hide'
  patch '/customers/complete' => 'customers#complete'


  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
