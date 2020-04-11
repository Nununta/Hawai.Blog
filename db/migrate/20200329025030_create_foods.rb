class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.date :date
      t.string :name
      t.string :food
      t.integer :price
      t.integer :quantity
      t.string :place

      t.timestamps
    end
  end
