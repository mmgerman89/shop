class ItemsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = "true OR unaccent(lower(name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@items = Item.where(condition1).joins(:brand).where(condition2)
			@items.each do |item|
				item.description = item.item_description# = item.description + ' ' + item.brand.name
			end
		end
		@items ||= Item.none

		render json: @items
	end
end