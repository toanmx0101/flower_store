class Admin::FeaturedsController < ApplicationController
  before_action :set_admin_featured, only: [:show, :edit, :update, :destroy]

  # GET /admin/featureds
  # GET /admin/featureds.json
  def index
    @admin_featureds = Featured.all
  end

  # GET /admin/featureds/1
  # GET /admin/featureds/1.json
  def show
  end

  # GET /admin/featureds/new
  def new
    @admin_featured = Featured.new
  end

  # GET /admin/featureds/1/edit
  def edit
  end

  # POST /admin/featureds
  # POST /admin/featureds.json
  def create
    @admin_featured = Featured.new(admin_featured_params)

    respond_to do |format|
      if @admin_featured.save
        format.html { redirect_to @admin_featured, notice: 'Featured was successfully created.' }
        format.json { render :show, status: :created, location: @admin_featured }
      else
        format.html { render :new }
        format.json { render json: @admin_featured.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/featureds/1
  # PATCH/PUT /admin/featureds/1.json
  def update
    respond_to do |format|
      if @admin_featured.update(admin_featured_params)
        format.html { redirect_to @admin_featured, notice: 'Featured was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_featured }
      else
        format.html { render :edit }
        format.json { render json: @admin_featured.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/featureds/1
  # DELETE /admin/featureds/1.json
  def destroy
    @admin_featured.destroy
    respond_to do |format|
      format.html { redirect_to admin_featureds_url, notice: 'Featured was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_featured
      @admin_featured = Featured.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_featured_params
      params.require(:admin_featured).permit(:product_id)
    end
end
