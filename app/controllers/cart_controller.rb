class CartController < ApplicationController
	def add_product_to_cart		
		add_product
	end

	def index
			
	end	
		
	private
	def add_product 		
		pr_dt_id = params[:session][:product_detail_id]
		quantity = params[:session][:quantity]
		if !(session[:current_cart].nil?)
			session[:current_cart][] += quantity if session[:current_cart].key?(pr_dt_id)
			session[:current_cart][2] = quantity unless session[:current_cart].keys.include? pr_dt_id
		elsif session[:current_cart].nil?
			session[:current_cart] = {2 => quantity	}
		end	
	end
end