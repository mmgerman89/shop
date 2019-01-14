class ValidateSuggestedBrandController < ApplicationController
  def index
    brand = []
    if params[:brand_name].present?
      brand_name = params[:brand_name]
      condition = "unaccent(lower(name)) = '#{I18n.transliterate(brand_name.downcase)}'"
      brand = Brand.where(condition)
    end
    result = if !brand.empty?
               [valid: true, id: brand.ids]
             else
               [valid: false, id: 0]
             end
    render json: result
  end
end
