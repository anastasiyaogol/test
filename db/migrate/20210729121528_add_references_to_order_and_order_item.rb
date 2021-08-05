class AddReferencesToOrderAndOrderItem < ActiveRecord::Migration[6.1]
  def change
  	add_reference :order_items, :order, foreign_key: true
  	add_reference :orders, :day_menu, foreign_key: true
  	add_reference :order_items, :day_menus_dish, foreign_key: true

  end
end
