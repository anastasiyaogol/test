class DayMenusDish < ApplicationRecord
	belongs_to :dish
  	belongs_to :day_menu

	validates :day_price,presence:true,length:{in: 1..6},numericality: true
	validates :dish_id,presence:true,length:{minimum:1},numericality: { only_integer: true }

	def self.by_dish(dish)
 		joins(dish: [:measure,:pricing_types]).where("dishes.id = ? ", dish)
	end

	def self.by_date_less(date_less)
 		joins(:day_menu).where("day_menus.date < ?",date_less)
 	end

 	def self.by_date_greater(date_greater)
 		joins(:day_menu).where("day_menus.date > ? ", date_greater)
 	end

 	def self.sort_by_field(sort_by_field,order_by)
 		order(sort_by_field => order_by)
 	end
end
