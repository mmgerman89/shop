class SaleDetailsController < ApplicationController
	before_action :set_sale, only: [:new, :create]

	def new
		@sale_details = @sale.sale_details.build
		@sale_details.item = Item.first
	end

	def create
		@sale.sale_details << SaleDetail.new(sale_details_params)
		@sale.save!
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:sale_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_details_params
      params.require(:sale_details).permit(:id, :sale_id, :item_id, :item_description, :number, :qty, :price, :_destroy)
    end
end