class Admin::PricesController < ApplicationController
  before_action :set_admin_price, only: [:show, :edit, :update, :destroy]

  # GET /admin/prices
  # GET /admin/prices.json
  def index
    @admin_prices = Price.all
  end

  # GET /admin/prices/1
  # GET /admin/prices/1.json
  def show
  end

  # GET /admin/prices/new
  def new
    @admin_price = Price.new
  end

  # GET /admin/prices/1/edit
  def edit
  end

  # POST /admin/prices
  # POST /admin/prices.json
  def create
    @admin_price = Price.new(admin_price_params)

    respond_to do |format|
      if @admin_price.save
        format.html { redirect_to @admin_price, notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @admin_price }
      else
        format.html { render :new }
        format.json { render json: @admin_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/prices/1
  # PATCH/PUT /admin/prices/1.json
  def update
    respond_to do |format|
      if @admin_price.update(admin_price_params)
        format.html { redirect_to @admin_price, notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_price }
      else
        format.html { render :edit }
        format.json { render json: @admin_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/prices/1
  # DELETE /admin/prices/1.json
  def destroy
    @admin_price.destroy
    respond_to do |format|
      format.html { redirect_to admin_prices_url, notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_price
      @admin_price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_price_params
      params.require(:admin_price).permit(:cost, :discount, :new, :product_detail_id)
    end
end
