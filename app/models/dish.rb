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
end
