class DishesController < ApplicationController 
	def new_dish
		@dish = Dish.new
	end
	def create_dish
		@dish = Dish.new dish_params
		if @dish.save
			redirect_to root_path
		else
			render :new_dish
		end
	end
 	def edit_dish
 		@dish = Dish.find_by id: params[:id]
 	end
 	def update_dish
 		@dish_update = Dish.find_by id: params[:id]
 		if @dish_update.update dish_params
 			redirect_to root_path
 		end
 	end
 	def destroy_dish
 		@dish = Dish.find_by id: params[:id]
 		@dish.destroy
 		redirect_to root_path
 	end
 	def show_dish
 		@dishes = Dish.joins("JOIN categories ON categories.id = dishes.category_id").select("dishes.*,categories.name AS dishes_category_name")
 		@dish = @dishes.find_by id: params[:id]
 	end
 	private 
 	def dish_params
 		params.require(:dish).permit(:name,:quantity,:measure,:price,:category_id)
 	end
end