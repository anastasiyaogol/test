class ChangeColumnsInDishes < ActiveRecord::Migration[6.1]
  def change
  	rename_column :dishes, :quantity, :units
  	remove_column :dishes, :measure
  	add_reference :dishes, :measure, foreign_key: true
  	add_reference :dishes, :pricing_types, foreign_key: true
  end
end
