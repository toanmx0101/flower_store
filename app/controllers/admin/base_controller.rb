class Admin::BaseController < ApplicationController
	# before_action :check_admin

	# private
	# def check_admim
	# 	next if current_user.admin?
	# 	flash[:danger] = "You're not admin!"
	#  	redirect_to root_path
	# end
end