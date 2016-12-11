class Admin::DashboardController < Admin::BaseController
	include SessionsHelper
	def home
		@number_user = User.count
		@number_order = Order.count
		
	end
end
