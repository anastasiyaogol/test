class Dish < ApplicationRecord
	validates :name,presence:true,length:{ in: 1..50}
	validates :quantity,presence:true,length:{ in: 1..6 },numericality: true
	validates :measure,presence:true,length:{in: 1..12}
	validates :price,presence:true,length:{in: 1..6},numericality: true
	validates :category_id,presence:true,length:{minimum:1},numericality: { only_integer: true }
end
