class AddSaleStateToSales < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :state, :integer
  end
end
