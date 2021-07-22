class CategoriesController < ApplicationController 
	def index 
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
 		@category = Category.new category_params
 		if @category.save
 			redirect_to categories_path
 		else
 			render :index
 		end
 	end

 	def edit
 		@category = Category.find_by id: params[:id]
 	end

 	def update
 		@category = Category.find_by id: params[:id]
 		if @category.update category_params
 			redirect_to categories_path
 		else
 			render :edit
 		end
 	end

 	def destroy
 		@category = Category.find_by id: params[:id]
 		if @category.dishes.any?
 			redirect_to categories_path, notice:"Category has dishes"	
 		else 
 			@category.destroy
 			redirect_to categories_path, notice:"Category has successfully destroyed"
		end
 	end

 	def show
 		@category = Category.find_by id: params[:id]
 	end

 	private 

 	def category_params
 		params.require(:category).permit(:name)
 	end
end