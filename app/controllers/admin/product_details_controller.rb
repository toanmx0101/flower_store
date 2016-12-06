class Admin::ProductDetailsController < Admin::BaseController
  before_action :set_admin_product_detail, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_details
  # GET /admin/product_details.json
  def index
    @admin_product_details = ProductDetail.all
  end

  # GET /admin/product_details/1
  # GET /admin/product_details/1.json
  def show
  end

  # GET /admin/product_details/new
  def new
    @admin_product_detail = ProductDetail.new
  end

  # GET /admin/product_details/1/edit
  def edit
  end

  # POST /admin/product_details
  # POST /admin/product_details.json
  def create
    @admin_product_detail = ProductDetail.new(admin_product_detail_params)

    respond_to do |format|
      if @admin_product_detail.save
        format.html { redirect_to @admin_product_detail, notice: 'Product detail was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product_detail }
      else
        format.html { render :new }
        format.json { render json: @admin_product_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_details/1
  # PATCH/PUT /admin/product_details/1.json
  def update
    respond_to do |format|
      if @admin_product_detail.update(admin_product_detail_params)
        format.html { redirect_to @admin_product_detail, notice: 'Product detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product_detail }
      else
        format.html { render :edit }
        format.json { render json: @admin_product_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_details/1
  # DELETE /admin/product_details/1.json
  def destroy
    @admin_product_detail.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_details_url, notice: 'Product detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_detail
      @admin_product_detail = ProductDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_detail_params
      params.require(:product_detail).permit(:type_product, :product_id, :code, :price, :new, :discount)
    end
end
