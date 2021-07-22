Rails.application.routes.draw do
	scope :admin do
  		devise_for :admins, controllers: {sessions:'admins/sessions'}
  	end
  	resources :categories
  	resources :dishes
  	resources :day_menus
  	root 'menu#index'
end
