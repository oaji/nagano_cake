Rails.application.routes.draw do

  root :to => 'customers/top#top'
  get 'customers/top/about'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  namespace :admin do

    resources :orders,only:[:index, :show, :update]

    resources :customers,only:[:index, :show, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:edit, :index, :create, :update]


    get 'admins/top'

  end



  scope module: :customers do

  resources :addresses, only: [:index, :destroy, :edit, :update]

  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/confirm'
  get 'orders/complete'

  resources :cart_items, only: [:index, :create, :edit, :update]

  resources :items, only: [:index, :show]

  resource :customers ,only: [:show, :update]
  get '/customer/edit/' => 'customers#edit', as: 'edit_customer'

  get '/customers/hide' => 'customers#hide'
  patch '/customers/hide' => 'customers#update'
  get '/customers/complete' => 'customers#complete'


  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
