class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :quantity
      t.string :measure
      t.float :price
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
