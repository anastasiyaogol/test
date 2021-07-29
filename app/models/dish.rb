class Dish < ApplicationRecord
	belongs_to :category
	belongs_to :measure
	belongs_to :pricing_types
	has_many :day_menus_dishes
  	has_many :day_menus, through: :day_menus_dishes
	validates :name,presence:true,length:{ in: 1..50}
	validates :units,presence:true,length:{ in: 1..6 },numericality: true
	validates :measure_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
	validates :pricing_types_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
	validates :category_id,presence:true,length:{minimum:1},numericality: { only_integer: true }

	def self.by_name(dish)
 		where("dishes.name LIKE ? ", "%#{dish}%")
	end

	def self.by_category_name(category)
 		joins(:category).where("categories.name LIKE ? ", "%#{category}%")
	end

	def self.by_pricing_type(pricing_type)
 		joins(:pricing_types).where("pricing_types.id =  #{pricing_type}")
	end

	def self.sort_by_field(sort_by_field,order_by)
 		order(sort_by_field => order_by)
 	end
end
