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
	validates :number, presence: true
	validates :date, presence: true

	def total
		0 #TODO
	end
end
