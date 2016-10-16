# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  number     :integer
#  item_id    :integer
#  qty        :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SaleDetail < ApplicationRecord
	belongs_to :sale
	belongs_to :item

	validates :item_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true

	accepts_nested_attributes_for :item


	def subtotal
		self.qty ? qty * unit_price : 0
	end

	def unit_price
		if persisted?
			price
		else
			item ? item.price : 0
		end
	end
end
