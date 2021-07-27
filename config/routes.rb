Rails.application.routes.draw do
	scope :admin do
  		devise_for :admins, controllers: {sessions:'admins/sessions'}
  	end
  	resources :categories
  	resources :dishes
  	resources :day_menus
  	resources :day_menus_dish_params, only: [:index]
  	root 'menu#index'
end
