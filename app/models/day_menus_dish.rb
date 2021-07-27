class DayMenusDish < ApplicationRecord
	belongs_to :dish
  	belongs_to :day_menu

	validates :day_price,presence:true,length:{in: 1..6},numericality: true
	validates :dish_id,presence:true,length:{minimum:1},numericality: { only_integer: true }

	def self.by_dish(dish)
 		joins(:dishes).where("dishes.name LIKE ? ", "%#{dish}%")
	end

	def self.by_date(date)
 		joins(:day_menu).where("day_menus.date <= ? ", "%#{date}%")
	end
end
