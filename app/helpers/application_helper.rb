module ApplicationHelper
	def full_title(page_title = '')
		if user_signed_in?
			base_title = current_user.commerce.name
		else
			base_title = 'Shop'
		end

		if page_title.empty?
			base_title
		else
			page_title + ' | ' + base_title
		end
	end
end
