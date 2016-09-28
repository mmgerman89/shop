class ValidateSuggestedBrandController < ApplicationController
  def index
  		brand = []
		if params[:brand_name].present?
			brand_name = params[:brand_name]
			condition = "unaccent(lower(name)) = '#{I18n.transliterate(brand_name.downcase)}'"
			brand = Brand.where(condition)
		end
		if !brand.empty?
			valid = true
		else
			valid = false
		end
		render json: valid
  end
end
