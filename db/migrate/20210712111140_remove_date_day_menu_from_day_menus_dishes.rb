class RemoveDateDayMenuFromDayMenusDishes < ActiveRecord::Migration[6.1]
  def change
  	remove_column :day_menus_dishes, :date_day_menu
  	add_reference :day_menus_dishes, :day_menus, foreign_key: true
  end
end
