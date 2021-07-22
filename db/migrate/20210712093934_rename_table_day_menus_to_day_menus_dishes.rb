class RenameTableDayMenusToDayMenusDishes < ActiveRecord::Migration[6.1]
  def change
  	rename_table :day_menus, :day_menus_dishes
  end
end
