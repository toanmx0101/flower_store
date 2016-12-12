class Admin::DashboardController < Admin::BaseController
	include SessionsHelper
	def home
		@number_user = User.count
		@number_order = Order.count
		@number_review = Product.count
		# @user = User.limit(8)	
		 # @products = Product.where(category_id: 1).all
		@user = User.where("created_at >= ?", 1.week.ago.utc).limit(8)
		@number_user_on_week = User.where("created_at >= ?", 1.week.ago.utc).limit(8).count
	end
end
