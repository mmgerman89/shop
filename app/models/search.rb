class Search
	def initialize(page, page_size, keywords, current_user = nil)
		@page = page
		@page_size = page_size
		@offset = page_size * page
		@keywords = keywords
		@current_user = current_user
	end


	def brands_by_name
		if @keywords.present?
		    brands = Brand.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Brand.where(name_condition).count
	    else
		    brands = Brand.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Brand.count
	    end
	    
	    return brands, number_of_pages
	end

	def categories_by_name
		if @keywords.present?
		    categories = Category.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Category.where(name_condition).count
	    else
		    categories = Category.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Category.count
	    end
	    
	    return categories, number_of_pages
	end

	def towns_by_name
		if @keywords.present?
		    towns = Town.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Town.where(name_condition).count
	    else
		    towns = Town.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Town.count
	    end
	    
	    return towns, number_of_pages
	end

	def units_by_name
		if @keywords.present?
		    units = Unit.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Unit.where(name_condition).count
	    else
		    units = Unit.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Unit.count
	    end
	    
	    return units, number_of_pages
	end


	def items_by_description
		if @keywords.present?
		    items = Item.where(description_condition).order(:description).offset(@offset).limit(@page_size)
		    @number_of_records = Item.where(description_condition).count
	    else
		    items = Item.order(:description).offset(@offset).limit(@page_size)
		    @number_of_records = Item.count
	    end
	    
	    return items, number_of_pages
	end

	def sales
		if @keywords.present?
		    sales = Sale.where(sale_condition).order(number: :desc).offset(@offset).limit(@page_size)
		    @number_of_records = Item.where(description_condition).count
	    else
		    sales = Sale.where(state: "confirmed").order(number: :desc).offset(@offset).limit(@page_size)
			@number_of_records = Sale.where(state: "confirmed").count
	    end

		return sales, number_of_pages
	end

	private

	def name_condition
		name_condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
	end

	def description_condition
		description_condition = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
	end

	def sale_condition
		number_condition = "number = #{@keywords.to_i} and user_id = #{@current_user.id} and state = 1"
	end

	def number_of_pages
		number_of_pages = (@number_of_records % @page_size) == 0 ? 
	                        @number_of_records / @page_size - 1 : @number_of_records / @page_size
	end
end