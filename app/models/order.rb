class Order < ApplicationRecord
	belongs_to :day_menu
	has_many :order_items
	accepts_nested_attributes_for :order_items, allow_destroy: true
  	validates_associated :order_items
end
