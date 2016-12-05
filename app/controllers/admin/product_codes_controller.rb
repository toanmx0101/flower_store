class Admin::ProductCodesController < ApplicationController
  before_action :set_admin_product_code, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_codes
  # GET /admin/product_codes.json
  def index
    @admin_product_codes = ProductCode.all
  end

  # GET /admin/product_codes/1
  # GET /admin/product_codes/1.json
  def show
  end

  # GET /admin/product_codes/new
  def new
    @admin_product_code = ProductCode.new
  end

  # GET /admin/product_codes/1/edit
  def edit
  end

  # POST /admin/product_codes
  # POST /admin/product_codes.json
  def create
    @admin_product_code = ProductCode.new(admin_product_code_params)

    respond_to do |format|
      if @admin_product_code.save
        format.html { redirect_to @admin_product_code, notice: 'Product code was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product_code }
      else
        format.html { render :new }
        format.json { render json: @admin_product_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_codes/1
  # PATCH/PUT /admin/product_codes/1.json
  def update
    respond_to do |format|
      if @admin_product_code.update(admin_product_code_params)
        format.html { redirect_to @admin_product_code, notice: 'Product code was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product_code }
      else
        format.html { render :edit }
        format.json { render json: @admin_product_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_codes/1
  # DELETE /admin/product_codes/1.json
  def destroy
    @admin_product_code.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_codes_url, notice: 'Product code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_code
      @admin_product_code = ProductCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_code_params
      params.require(:admin_product_code).permit(:store_id, :status)
    end
end
