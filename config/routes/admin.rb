Rails.application.routes.draw do
  
	namespace :admin do 
  resource :products
  get '', to: 'dashboard#home', as: '/' 

  resource :dashboard do
    post :edit_multiple
    put :update_multiple
  end
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
end
end
