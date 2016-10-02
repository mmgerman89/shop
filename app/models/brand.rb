# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ApplicationRecord
	include ActiveModel::Validations

	validates :name, presence: true

	validates_with ValidateUnaccent, model: self
end
