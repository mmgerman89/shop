class ItemsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@items = Item.where(condition)
		end
		@items ||= Item.none

		render json: @items
	end
end