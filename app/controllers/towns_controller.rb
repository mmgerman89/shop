class TownsController < ApplicationController
  before_action :set_town, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 10

  # GET /towns
  # GET /towns.json
  def index
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      @towns = Town.where("unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'").order(:name)
                      .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Town.where("unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'").count
    else
      @towns = Town.order(:name).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Town.count
    end
    @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                        number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /towns/1
  # GET /towns/1.json
  def show
  end

  # GET /towns/new
  def new
    @town = Town.new
  end

  # GET /towns/1/edit
  def edit
  end

  # POST /towns
  # POST /towns.json
  def create
    @town = Town.new(town_params)

    respond_to do |format|
      if @town.save
        format.html { redirect_to towns_url, notice: 'Localidad Creada.' }
        format.json { render :show, status: :created, location: @town }
      else
        format.html { render :new }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /towns/1
  # PATCH/PUT /towns/1.json
  def update
    respond_to do |format|
      if @town.update(town_params)
        format.html { redirect_to towns_url, notice: 'Localidad Actualizada.' }
        format.json { render :show, status: :ok, location: @town }
      else
        format.html { render :edit }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /towns/1
  # DELETE /towns/1.json
  def destroy
    @town.destroy
    respond_to do |format|
      format.html { redirect_to towns_url, notice: 'Town was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_town
      @town = Town.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def town_params
      params.require(:town).permit(:name, :code)
    end
end
