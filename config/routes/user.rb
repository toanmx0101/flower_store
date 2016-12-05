Rails.application.routes.draw do
	resources :orders
  resources :categories
  
  resources :products
  # For details on the DSL available within this file, see http:guides.rubyonrails.orgrouting.html
  root "static_pages#home"
  get  'help',    to: 'static_pages#help'
  get  'about',   to: 'static_pages#about'
  get  'contact', to: 'static_pages#contact'
  get  'setting', to: 'static_pages#setting'
  get  'signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get  'account', to: 'users#account'

  get    'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  get 'logout',  to: 'sessions#destroy'
  
  post   'checkout_login',   to: 'cart#create'

  get    'checkout', to: 'cart#checkout'
  get    'checkout_step1', to: 'cart#checkout_step1'
  get    'checkout_step2', to: 'cart#checkout_step2'
  get    'checkout_step2_guest', to: 'cart#checkout_step2_guest'
  get    'checkout_step2_register_account', to: 'cart#checkout_step2_register_account'
  get    'checkout_step3', to: 'cart#checkout_step3'
  get    'checkout_step4', to: 'cart#checkout_step4'
  get    'checkout_step5', to: 'cart#checkout_step5'
  get    'shoppingcart', to: 'cart#index'
  get    'checkout_success', to: 'cart#checkout_success'
  get    'search', to: 'static_pages#search'

  post 'category/sort_product'

  resources :users
  post 'user/add_review', to: 'users#add_review'
  resources :carts, only: [:show, :update]
  post 'cart/add_product_to_cart'
  post 'cart/add_address'
  post 'cart/checkout_guest'
  post 'cart/add_comment_order'
  post 'cart/confirm_order'
  post 'cart/checkout_register_account'
  post 'cart/checkout_login'
  
  

end