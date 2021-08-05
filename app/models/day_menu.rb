class DayMenu < ApplicationRecord
	has_many :day_menus_dishes, dependent: :destroy
  	has_many :dishes, through: :day_menus_dishes
  	has_many :orders
  	validates :date,presence:true,length:{minimum:8}
  	accepts_nested_attributes_for :day_menus_dishes, allow_destroy: true
  	validates_associated :day_menus_dishes
end