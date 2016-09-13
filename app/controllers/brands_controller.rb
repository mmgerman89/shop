class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 10

  # GET /brands
  # GET /brands.json
  def index
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      @brands = Brand.where("unaccent(lower(name)) LIKE '%#{@keywords.downcase}%'").order(:name)
                      .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Brand.where("unaccent(lower(name)) LIKE '%#{@keywords.downcase}%'").count
    else
      @brands = Brand.order(:name).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Brand.count
    end
    @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                        number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_url, notice: 'Marca creada.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_url, notice: 'Marca actualizada.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Marca eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(:name)
    end
end
