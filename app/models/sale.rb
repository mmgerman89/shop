# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  number     :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ApplicationRecord
	has_many :sale_details#, inverse_of: :sales

	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :sale_details


	def total
		details = self.sale_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.price
		end
		total
	end
end
