class AddNumberToSaleDetails < ActiveRecord::Migration[5.0]
  def change
  	sales = Sale.all
  	sales.each do |sale|
  		num = 1
  		sale.sale_details.each do |sd|
  			sd.number = num
  			sd.save!
  			num += 1
  		end
  		sale.save!
  	end
  end
end
