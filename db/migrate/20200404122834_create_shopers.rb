class CreateShopers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopers do |t|
      t.references :shop, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
