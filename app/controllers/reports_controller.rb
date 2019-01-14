class ReportsController < ApplicationController
  PAGE_SIZE = 10
  def index
    @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords, current_user)
    @reports, @number_of_pages = search.sales
  end
end
