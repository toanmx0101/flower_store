class Admin::BillsController < ApplicationController
  before_action :set_admin_bill, only: [:show, :edit, :update, :destroy]

  # GET /admin/bills
  # GET /admin/bills.json
  def index
    @admin_bills = Bill.all
  end

  # GET /admin/bills/1
  # GET /admin/bills/1.json
  def show
  end

  # GET /admin/bills/new
  def new
    @admin_bill = Bill.new
  end

  # GET /admin/bills/1/edit
  def edit
  end

  # POST /admin/bills
  # POST /admin/bills.json
  def create
    @admin_bill = Bill.new(admin_bill_params)

    respond_to do |format|
      if @admin_bill.save
        format.html { redirect_to @admin_bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @admin_bill }
      else
        format.html { render :new }
        format.json { render json: @admin_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bills/1
  # PATCH/PUT /admin/bills/1.json
  def update
    respond_to do |format|
      if @admin_bill.update(admin_bill_params)
        format.html { redirect_to @admin_bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_bill }
      else
        format.html { render :edit }
        format.json { render json: @admin_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bills/1
  # DELETE /admin/bills/1.json
  def destroy
    @admin_bill.destroy
    respond_to do |format|
      format.html { redirect_to admin_bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bill
      @admin_bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_bill_params
      params.require(:admin_bill).permit(:input_price, :selling_price, :product_details_id, :quantity)
    end
end
