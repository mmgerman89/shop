class Category < ApplicationRecord
	include ActiveModel::Validations
	
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	validates_with ValidateUnaccent
end
