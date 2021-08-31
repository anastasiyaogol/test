class Order < ApplicationRecord
	before_update :total_price
	belongs_to :day_menu
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true
  	validates_associated :order_items
  	validates :total_price,presence:true,length:{ in: 1..10},numericality: { greater_than: 0 }
  	def total_price
  		self.total_price = order_items.reject(&:marked_for_destruction?).sum(&:price).round(2);
  	end
end
