class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :day_menus_dish
end
