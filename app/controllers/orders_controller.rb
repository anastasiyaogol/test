class OrdersController < ApplicationController 
	def index
		@orders = Order.all
 	end

	def new
		@order = Order.new(day_menu_id: params[:day_menu_id])
		if @order.day_menu != nil
			@order_grouped_by_categories = @order.day_menu.day_menus_dishes.includes(dish: [:category,:pricing_types,:measure]).group_by{|t|t.dish.category.name}
		end
	end

	def create
		@order = Order.new order_params
		if @order.save
			redirect_to orders_path
		else
			render :new
		end
	end

 	def edit
 		@order = Order.find_by id: params[:id]
 		@order_grouped_by_categories = @order.day_menu.day_menus_dishes.includes(dish: [:category,:pricing_types,:measure]).group_by{|t|t.dish.category.name}
 	end

 	def update
 		@order = Order.find_by id: params[:id]
 		if @order.update order_params
 			redirect_to orders_path
 		else
 			render :edit
 		end
 	end

 	def destroy
		@order = Order.find_by id: params[:id]
 			@order.destroy
 			redirect_to orders_path, notice:"Order has been successfully destroyed"	
 	end

 	def show
 		@order = Order.find params[:id]
 		@order_grouped_by_categories = @order.order_items.includes(day_menus_dish: {dish: [:category,:pricing_types,:measure]}).group_by{|t|t.day_menus_dish.dish.category.name}
 	end

 	private 

 	def order_params
 		params.require(:order).permit(:total_price,:day_menu_id,order_items_attributes:[:id,:quantity,:price,:day_menus_dish_id,:_destroy])
 	end
end