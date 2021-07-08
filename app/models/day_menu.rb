class DayMenu < ApplicationRecord
	validates :date_day_menu,presence:true
	validates :day_price,presence:true,length:{in: 1..6},numericality: true
	validates :dish_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
end
