# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	include ActiveModel::Validations
	
	validates :name, presence: true

	validates_with ValidateUnaccent, model: self, action_name: "create", on: :create
	validates_with ValidateUnaccent, model: self, action_name: "update", on: :update
end
