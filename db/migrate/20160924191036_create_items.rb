class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :description
      t.references :brand, foreign_key: true
      t.references :unit, foreign_key: true
      t.integer :stock
      t.integer :min_stock
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
