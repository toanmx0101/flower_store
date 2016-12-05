class Admin::SpecialsController < ApplicationController
  before_action :set_admin_special, only: [:show, :edit, :update, :destroy]

  # GET /admin/specials
  # GET /admin/specials.json
  def index
    @admin_specials = Special.all
  end

  # GET /admin/specials/1
  # GET /admin/specials/1.json
  def show
  end

  # GET /admin/specials/new
  def new
    @admin_special = Special.new
  end

  # GET /admin/specials/1/edit
  def edit
  end

  # POST /admin/specials
  # POST /admin/specials.json
  def create
    @admin_special = Special.new(admin_special_params)

    respond_to do |format|
      if @admin_special.save
        format.html { redirect_to @admin_special, notice: 'Special was successfully created.' }
        format.json { render :show, status: :created, location: @admin_special }
      else
        format.html { render :new }
        format.json { render json: @admin_special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/specials/1
  # PATCH/PUT /admin/specials/1.json
  def update
    respond_to do |format|
      if @admin_special.update(admin_special_params)
        format.html { redirect_to @admin_special, notice: 'Special was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_special }
      else
        format.html { render :edit }
        format.json { render json: @admin_special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/specials/1
  # DELETE /admin/specials/1.json
  def destroy
    @admin_special.destroy
    respond_to do |format|
      format.html { redirect_to admin_specials_url, notice: 'Special was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_special
      @admin_special = Special.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_special_params
      params.require(:admin_special).permit(:product_id)
    end
end
