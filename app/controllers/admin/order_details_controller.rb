class Admin::OrderDetailsController < ApplicationController
  before_action :set_admin_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /admin/order_details
  # GET /admin/order_details.json
  def index
    @admin_order_details = OrderDetail.all
  end

  # GET /admin/order_details/1
  # GET /admin/order_details/1.json
  def show
  end

  # GET /admin/order_details/new
  def new
    @admin_order_detail = OrderDetail.new
  end

  # GET /admin/order_details/1/edit
  def edit
  end

  # POST /admin/order_details
  # POST /admin/order_details.json
  def create
    @admin_order_detail = OrderDetail.new(admin_order_detail_params)

    respond_to do |format|
      if @admin_order_detail.save
        format.html { redirect_to @admin_order_detail, notice: 'Order detail was successfully created.' }
        format.json { render :show, status: :created, location: @admin_order_detail }
      else
        format.html { render :new }
        format.json { render json: @admin_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/order_details/1
  # PATCH/PUT /admin/order_details/1.json
  def update
    respond_to do |format|
      if @admin_order_detail.update(admin_order_detail_params)
        format.html { redirect_to @admin_order_detail, notice: 'Order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @admin_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/order_details/1
  # DELETE /admin/order_details/1.json
  def destroy
    @admin_order_detail.destroy
    respond_to do |format|
      format.html { redirect_to admin_order_details_url, notice: 'Order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order_detail
      @admin_order_detail = OrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_order_detail_params
      params.require(:admin_order_detail).permit(:order_id, :product_details_id, :quantity, :price)
    end
end
