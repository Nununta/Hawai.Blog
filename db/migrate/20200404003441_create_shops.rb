class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.date :date
      t.string :shopname
      t.string :content
      t.string :place

      t.timestamps
    end
  end
end
