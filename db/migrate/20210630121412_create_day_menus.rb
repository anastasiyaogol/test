class CreateDayMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :day_menus do |t|
      t.belongs_to :dish,index: true, foreign_key: true
      t.float :day_price
      t.date :date_day_menu

      t.timestamps
    end
  end
end
