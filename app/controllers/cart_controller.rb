class CartController < ApplicationController
	def add_product_to_cart		
		add_product
	end

	def index
		session[:current_cart].each do |key, value|
			
		end
	end	


	def checkout_step1
		if logged_in?
				redirect_to	(checkout_step2_path)
		end
	end

	def checkout_step2
		
	end

	def checkout_step3
		
	end

	def checkout_step4
		
	end

	def checkout_step5
		
	end

	private
	def add_product 		
		pr_id = params[:session][:product_id]
		type_product = params[:session][:type_product]
		quantity = params[:session][:quantity]
		product_detail = ProductDetail.where(product_id: pr_id,type_product: type_product).pluck(:id);
		id = product_detail[0];
		
		if !(session[:current_cart].nil?)
			if (session[:current_cart].key?(id.to_s))
				session[:current_cart][id.to_s] = session[:current_cart][id.to_s] + quantity.to_i 
			end	
			if !(session[:current_cart].key? (id.to_s))
						session[:current_cart][id.to_i] = quantity.to_i 
			end
		end		

		if (session[:current_cart].nil?)
			session[:current_cart] = {id.to_i => quantity.to_i	}
		end	
	end
end