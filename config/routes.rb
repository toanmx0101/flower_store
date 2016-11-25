Rails.application.routes.draw do
  resources :orders
  namespace :admin do
    get 'dashboard/home'
  end

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
  delete 'logout',  to: 'sessions#destroy'

  get    'checkout', to: 'cart#checkout'
  get    'checkout/step1', to: 'cart#checkout_step1'
  get    'checkout/step2', to: 'cart#checkout_step2'
  get    'checkout/step3', to: 'cart#checkout_step3'
  get    'checkout/step4', to: 'cart#checkout_step4'
  get    'checkout/step5', to: 'cart#checkout_step5'
  get    'shoppingcart', to: 'cart#index'
  resources :users
end
