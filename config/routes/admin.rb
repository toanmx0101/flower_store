Rails.application.routes.draw do
  namespace :admin do 

    resources :products
    resources :product_details
    resources :admins
    resources :users
    resources :images
    resources :orders
    resources :orders_details
    resources :sessions
    resources :comments

    get '', to: 'dashboard#home', as: '/' 

    resource :dashboard do
      post :edit_multiple
      put :update_multiple
    end
  end

end
