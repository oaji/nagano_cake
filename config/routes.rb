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
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/edit'
    get 'genres/index'
    get 'genres/create'
    get 'genres/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'admins/top'
  end
  namespace :customers do
    get 'addresses/index'
    get 'addresses/destroy'
    get 'addresses/edit'
    get 'addresses/update'
  end
  namespace :customers do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customers do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/edit'
    get 'cart_items/update'
  end
  namespace :customers do
    get 'items/index'
    get 'items/show'
  end
  namespace :customers do
    resource :customers,only: [:show,:edit,:update]
    patch "/customers/hide" => "customers#hide"
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
