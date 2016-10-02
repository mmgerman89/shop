# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Unit < ApplicationRecord
	include ActiveModel::Validations

	validates :name, presence: true

	validates_with ValidateUnaccent, model: self
end
