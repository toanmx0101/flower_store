Rails.application.routes.draw do
  namespace :admin do 
    resources :products
    resources :users
    resources :images
    resources :orders
    
    get '', to: 'dashboard#home', as: '/' 

    resource :dashboard do
      post :edit_multiple
      put :update_multiple
    end
  end

end
