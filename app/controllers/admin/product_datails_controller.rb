class Admin::ProductDatailsController < ApplicationController
  before_action :set_admin_product_datail, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_datails
  # GET /admin/product_datails.json
  def index
    @admin_protails = Admin::ProductDatail.all
  end

  # GET /admin/product_datails/1
  # GET /admin/product_datails/1.json
  def show
  end

  # GET /admin/product_datails/new
  def new
    @admin_product_datail = ProductDatail.new
  end

  # GET /admin/product_datails/1/edit
  def edit
  end

  # POST /admin/product_datails
  # POST /admin/product_datails.json
  def create
    @admin_product_datail = ProductDatail.new(admin_product_datail_params)

    respond_to do |format|
      if @admin_product_datail.save
        format.html { redirect_to @admin_product_datail, notice: 'Product datail was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product_datail }
      else
        format.html { render :new }
        format.json { render json: @admin_product_datail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_datails/1
  # PATCH/PUT /admin/product_datails/1.json
  def update
    respond_to do |format|
      if @admin_product_datail.update(admin_product_datail_params)
        format.html { redirect_to @admin_product_datail, notice: 'Product datail was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product_datail }
      else
        format.html { render :edit }
        format.json { render json: @admin_product_datail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_datails/1
  # DELETE /admin/product_datails/1.json
  def destroy
    @admin_product_datail.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_datails_url, notice: 'Product datail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_datail
      @admin_product_datail = ProductDatail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_datail_params
      params.require(:admin_product_datail).permit(:color, :type, :product_id, :code, :quantity)
    end
end
