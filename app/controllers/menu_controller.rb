class MenuController < ApplicationController
	ActionController::Parameters.permit_all_parameters = true
	def index
		@categories = Category.all
		@dishes = Dish.joins("JOIN categories ON categories.id = dishes.category_id").select("dishes.*,categories.name AS dishes_category_name")
		@day_menus = DayMenu.joins("JOIN dishes ON dishes.id = day_menus.dish_id").select("day_menus.*, dishes.name AS day_menu_dish_name, dishes.measure AS day_menu_dish_measure, dishes.quantity AS day_menu_dish_quantity,dishes.category_id AS day_menu_category_id")
 		@category = Category.new
 		@category_edit = Category.find_by id: params[:id]
 		if params[:menu] != nil
 			@event = params[:menu]
 		end
 		
 	end
 	def create_category
 		@category = Category.new category_params
 		if @category.save
 			redirect_to root_path
 		else
 			render :index
 		end
 	end
 	private 
 	def category_params
 		params.require(:category).permit(:name)
 	end
end