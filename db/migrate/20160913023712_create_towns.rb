class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :code

      t.timestamps
    end
  end
end
