class OrdersController < ApplicationController 
	before_action :find_by_id, only: [:edit, :update, :destroy, :show]
	def index
		@orders = Order.all
 	end

	def new
		@order = Order.new(day_menu_id: params[:day_menu_id])
	end

	def create
		@order = Order.new order_params
		if @order.save
			redirect_to orders_path, notice:"Order has been successfully created"
		else
			flash[:alert] = "Order hasn't been successfully created,check your inputs"
			render :new
		end
	end

 	def edit
 		
 	end

 	def update
 		if @order.update order_params
 			redirect_to orders_path, notice:"Order has been successfully updated"	
 		else
 			flash[:alert] = "Order hasn't been successfully created,check your inputs: #{@order.errors.full_messages.join('.')}"
 			render :edit
 		end
 	end

 	def destroy
 			@order.destroy
 			redirect_to orders_path, notice:"Order has been successfully destroyed"	
 	end

 	def show
 		@order_grouped_by_categories = @order.order_items.includes(day_menus_dish: {dish: [:category,:pricing_types,:measure]}).group_by{|t|t.day_menus_dish.dish.category.name}
 	end

 	private 

 	def order_params
 		params.require(:order).permit(:total_price,:day_menu_id,order_items_attributes:[:id,:quantity,:price,:day_menus_dish_id,:_destroy])
 	end
 	def find_by_id
 		@order = Order.find_by id: params[:id]
 	end
end