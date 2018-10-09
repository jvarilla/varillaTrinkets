Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :promotions
  get 'reports/reportlist'

  get 'reports/custlist'

  get 'reports/productlist'

  get 'reports/salelist'

  resources :order_items
  resources :orders
  resources :email_lists
  resources :email_messages
  resources :shipping_options
  resources :reviews
  resources :page_visits
  resources :wish_lists
  resources :products
  resources :pages
  resources :suppliers
  resources :animals
  resources :users
  root 'home#index'

  get 'home/index'

  get 'home/about'

  get 'home/contact'

  get 'home/help'

  get 'home/privacy'

  get 'home/search'

  post 'home/search'

  get 'login', to: 'sessions#new', as: 'login'

  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

  get 'home/catalog'

  get 'home/catalogitem'

  post 'home/buy'
  post 'home/updatecart'
  post 'home/checkout'
  get 'home/checkout'
  get 'cart', to: 'home#cart', as: 'cart'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
