class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :number
      t.date :date

      t.timestamps
    end
  end
end
