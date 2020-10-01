Rails.application.routes.draw do

  root :to => 'customers/top#top'

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

    resources :genres, only: [:edit, :index, :create, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    get 'admins/top'

  end




  namespace :customers do

  resources :addresses, only: [:index, :destroy, :edit, :update]

  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/confirm'
  get 'orders/complete'

  resources :cart_items, only: [:index, :create, :edit, :update]

  resources :items, only: [:index, :show]

  resource :customers,only: [:show,:edit,:update]

  patch "/customers/hide" => "customers#hide"

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
