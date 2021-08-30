class OrderItem < ApplicationRecord
	after_validation :price
	belongs_to :order
	belongs_to :day_menus_dish
	validates :quantity,presence:true,length:{ in: 1..10},numericality: true
	validates :price,presence:true,length:{ in: 1..10 },numericality: true
	#validates :order_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
	validates :day_menus_dish_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
	def price 
		if !marked_for_destruction? and errors.empty?
	 		day_price = day_menus_dish.day_price
				if day_menus_dish.dish.pricing_types.is_by_weight?
					self.price = (day_price*quantity/day_menus_dish.dish.units).round(2)
				else
					self.price = (quantity*day_price).round(2)
				end
		end
  	end
end

