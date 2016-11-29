Rails.application.routes.draw do
	namespace :admin do
    get 'dashboard/home'
  end
end