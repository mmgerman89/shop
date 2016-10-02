class ValidateSuggestedBrandController < ApplicationController
  def index
  		brand = []
		if params[:brand_name].present?
			brand_name = params[:brand_name]
			condition = "unaccent(lower(name)) = '#{I18n.transliterate(brand_name.downcase)}'"
			brand = Brand.where(condition)
		end
		if !brand.empty?
			result = [valid: true, id: brand.ids]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end
