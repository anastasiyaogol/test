class ChangeDayMenuIdInDayMenuDish < ActiveRecord::Migration[6.1]
  def change
  	rename_column :day_menus_dishes, :day_menus_id, :day_menu_id
  end
end
