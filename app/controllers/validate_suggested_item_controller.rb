class ValidateSuggestedItemController < ApplicationController
  def index
  		item = []
		if params[:item_description].present?
			item_description = params[:item_description]
			condition = "unaccent(lower(description || ' ' || name)) = '#{I18n.transliterate(item_description.downcase)}'"
			item = Item.joins(:brand).where(condition)
		end
		if !item.empty?
			result = [valid: true, id: item.first.id, price: item.first.price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end
