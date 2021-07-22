class DishesController < ApplicationController 
	def index
		@categories = Category.all
		@dishes = Dish.all
 		if params[:menu] != nil
 			@event = params[:menu]
 		end
 		
 	end
	def new
		@dish = Dish.new
	end
	def create
		@dish = Dish.new dish_params
		if @dish.save
			redirect_to dishes_path
		else
			render :new
		end
	end
 	def edit
 		@dish = Dish.find_by id: params[:id]
 	end
 	def update
 		@dish = Dish.find_by id: params[:id]
 		if @dish.update dish_params
 			redirect_to dishes_path
 		else
 			render :edit
 		end
 	end
 	def destroy
		@dish = Dish.find_by id: params[:id]
		 if @dish.day_menus_dishes.any?
			redirect_to dishes_path, notice: "Dish #{@dish.name} has been decleared in the Day Menu"
		else 
 			@dish.destroy
 			redirect_to dishes_path,notice:"Dish #{@dish.name} has been successfully destroyed"
		end 		
 	end
 	def show
 		@dish = Dish.find params[:id]
		respond_to do |format|
  			format.html
  			format.json { render :json => @dish.to_json(:include => [:pricing_types,:measure,:day_menus_dishes,:day_menus]) }
		end
 	end
 	private 
 	def dish_params
 		params.require(:dish).permit(:name,:units,:measure_id,:pricing_types_id,:category_id)
 	end
end