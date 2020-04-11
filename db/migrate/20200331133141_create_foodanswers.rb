class CreateFoodanswers < ActiveRecord::Migration[5.2]
  def change
    create_table :foodanswers do |t|
      t.references :food, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
