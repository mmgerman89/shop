class SaleDetailsController < ApplicationController
	before_action :set_sale, only: [:new, :create, :destroy]	

	def new
		@sale_details = @sale.sale_details.build
		@sale_details.item = Item.first
	end

	def create
		item_exists = false
		item_id = params[:sale_details][:item_id].to_i
		@sale.sale_details.each do |detail|
			if detail.item_id == item_id
				# Ya existe el item en la factura, agregar cantidad
				item_exists = true
				@sale_detail = detail
				@saved_sale_detail = detail.id
				break
			end
		end
		if item_exists
			@sale_detail.qty += params[:sale_details][:qty].to_i
			@sale_detail.price = params[:sale_details][:price].to_f
			@sale_detail.save!
		else
			sale_detail = SaleDetail.new(sale_details_params)
			if @sale.sale_details.last.nil?
				sale_detail.number = 1
			else
				sale_detail.number = @sale.sale_details.last.number + 1
			end
			@sale.sale_details << sale_detail
		end
		@sale.save!
	end

	def edit
		@sale_detail = SaleDetail.find(params[:id])
	end

	def update
	end

	def destroy
		@sale_detail = SaleDetail.find(params[:id])
		@sale_detail.destroy

		respond_to do |format|
			format.js { render layout: false }
		end
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