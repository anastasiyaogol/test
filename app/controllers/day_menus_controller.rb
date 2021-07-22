class DayMenusController < ApplicationController 
	def index
		@day_menus = DayMenu.all
 	end

	def new
 		@day_menu = DayMenu.new
 		@day_menu.day_menus_dishes=[]
	end

	def create
		@day_menu = DayMenu.new day_menu_params
		if @day_menu.save
			redirect_to day_menus_path
		else 
			render :new
		end
	end

 	def edit
 		@day_menu = DayMenu.find params[:id]
 	end

 	def update
 		@day_menu = DayMenu.find_by id: params[:id]
 		if @day_menu.update day_menu_params
 			redirect_to day_menus_path
 		else
 			render :edit
 		end
 	end

 	def destroy
 		@day_menu = DayMenu.find_by id: params[:id]
 		if @day_menu.destroy
 			redirect_to day_menus_path
 		end
 	end

 	def show
 		@day_menu = DayMenu.find params[:id]
 		@day_menu_grouped_by_categories = @day_menu.day_menus_dishes.includes(dish: :category).group_by{|t|t.dish.category.name}
 	end

 	private 
 	
 	def day_menu_params
 		params.require(:day_menu).permit(:id,:date,day_menus_dishes_attributes:[:id,:dish_id,:day_price,:_destroy])
 	end
end