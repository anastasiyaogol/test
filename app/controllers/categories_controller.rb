class CategoriesController < ApplicationController 
	def index 
		@categories = Category.all
	end
 	def edit_category
 		@category = Category.find_by id: params[:id]
 	end
 	def update_category
 		@category_update = Category.find_by id: params[:id]
 		if @category_update.update category_params
 			redirect_to root_path
 		else
 			render :index
 		end
 	end
 	def destroy_category
 		@category = Category.find_by id: params[:id]
 		@category.destroy
 		redirect_to root_path
 	end
 	def show_category
 		@category = Category.find_by id: params[:id]
 	end
 	private 
 	def category_params
 		params.require(:category).permit(:name)
 	end
end