class AddNameIndexToBrands < ActiveRecord::Migration[5.0]
  def change
  	add_index :brands, :name
  end
end
