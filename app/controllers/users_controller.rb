class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @reviews = Review.where(user_id: current_user.id).order('created_at DESC');
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def add_review
    add_user_review
  end

  def add_comment
    add_user_comment
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        flash.now[:danger] =  'Invalid email/password combination'
        render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])  
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @delete = User.find(params[:id]).destroy
    flash[:success] = "User deleted: "+@delete.name
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone,:address,:photo,:password,:password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def add_user_review
      if (params[:session][:review] != "")
        current_user.reviews.create content: params[:session][:review]
        redirect_to :back
      end
    end

    def add_user_comment

    end
  end