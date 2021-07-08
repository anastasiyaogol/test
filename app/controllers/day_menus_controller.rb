class DayMenusController < ApplicationController 
	def new_day_menu
		@dishes = Dish.joins("JOIN categories ON categories.id = dishes.category_id").select("dishes.*,categories.name AS dishes_category_name")
 		@dish = @dishes.find_by id: params[:id]
		@categories = Category.all
 		@dishes = Dish.joins("JOIN categories ON categories.id = dishes.category_id").select("dishes.*,categories.name AS dishes_category_name")
 		@day_menus = DayMenu.joins("JOIN dishes ON dishes.id = day_menus.dish_id").select("day_menus.*, dishes.name AS day_menu_dish_name, dishes.measure AS day_menu_dish_measure, dishes.quantity AS day_menu_dish_quantity,dishes.category_id AS day_menu_category_id")
 		@day_menu = @day_menus.find_by id: params[:id]
 		DayMenu.all.each do |m|
				if @dish.id == m.dish_id
					@dish.price = m.day_price
				end
			end
 		@day_menu = DayMenu.new
	end
	def create_day_menu_dish
		@day_menu = DayMenu.new day_menu_dish_params
		if @day_menu.save
			redirect_to root_path
		else
			render :new_day_menu_dish
		end
	end
 	def edit_day_menu_dish
 		@day_menu = DayMenu.find_by id: params[:id]
 	end
 	def update_day_menu_dish
 		@day_menu_update = DayMenu.find_by id: params[:id]
 		if @day_menu_update.update day_menu_dish_params
 			redirect_to root_path
 		end
 	end
 	def destroy_day_menu_dish
 		@day_menu = DayMenu.find_by id: params[:id]
 		@day_menu.destroy
 		redirect_to root_path
 	end
 	def show_day_menu_dish
 		@categories = Category.all
 		@dishes = Dish.joins("JOIN categories ON categories.id = dishes.category_id").select("dishes.*,categories.name AS dishes_category_name")
 		@day_menus = DayMenu.joins("JOIN dishes ON dishes.id = day_menus.dish_id").select("day_menus.*, dishes.name AS day_menu_dish_name, dishes.measure AS day_menu_dish_measure, dishes.quantity AS day_menu_dish_quantity,dishes.category_id AS day_menu_category_id")
 		@day_menu = @day_menus.find_by id: params[:id]
		
 	end
 	private 
 	def day_menu_dish_params
 		params.require(:day_menu).permit(:dish_id,:day_price,:date_day_menu)
 	end
 	def dish_params
 		params.require(:dish).permit(:name,:quantity,:measure,:price,:category_id)
 	end
end