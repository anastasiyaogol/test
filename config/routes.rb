Rails.application.routes.draw do
	scope :admin do
  		devise_for :admins, controllers: {sessions:'admins/sessions'}
  	end
	get '/categories', to:'categories#index'
	post '/categories', to: 'menu#create_category'
	post '/day_menu/:event', to: 'menu#index', as: 'menu_date'
	patch '/categories/:id', to: 'categories#update_category', as: 'category_update'
	get '/caregories/:id', to: 'categories#show_category', as: 'show_category'
	get '/caregories/:id/edit', to: 'categories#edit_category', as: 'edit_category'
	delete '/categories/:id', to:'categories#destroy_category', as: 'destroy_category'
	get '/dishes/new', to: 'dishes#new_dish', as: 'dish_new'
	post '/dishes', to: 'dishes#create_dish'
	patch '/dishes/:id', to: 'dishes#update_dish', as: 'dish_update'
	get '/dishes/:id', to: 'dishes#show_dish', as: 'show_dish'
	get '/dishes/:id/edit', to: 'dishes#edit_dish', as: 'edit_dish'
	delete '/dishes/:id', to:'dishes#destroy_dish', as: 'destroy_dish'
	post '/day_menus', to: 'day_menus#create_day_menu_dish',as:'create_day_menu_dish'
	patch '/day_menus/:id', to: 'day_menus#update_day_menu_dish', as: 'dish_day_menu_update'
	get '/day_menus/:id/new', to: 'day_menus#new_day_menu', as: 'new_day_menu'
	get '/day_menus/:id', to: 'day_menus#show_day_menu_dish', as: 'show_day_menu_dish'
	get '/day_menus/:id/edit', to: 'day_menus#edit_day_menu_dish', as: 'edit_day_menu_dish'
	delete '/day_menus/:id', to:'day_menus#destroy_day_menu_dish', as: 'destroy_day_menu_dish'
  	root 'menu#index'
end
