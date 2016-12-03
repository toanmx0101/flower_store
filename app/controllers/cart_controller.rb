class CartController < ApplicationController

	def add_product_to_cart		
		add_product
	end

	def index
		unless (session[:current_cart].nil?)
			session[:current_cart].each do |key, value|			
			end
		end
	end	


	def checkout_step1

		if logged_in?
				redirect_to	(checkout_step2_path)
		end

	end

	def checkout_guest

		if (params[:account] == "guest")
			redirect_to (checkout_step2_guest_path)
		else	
			redirect_to (checkout_step2_register_account_path)
		end
	end


	def create
	    user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      log_in user
	      remember user
	      redirect_to checkout_step2_path
	    else
	        flash[:danger] = 'Invalid email/password combination' # Not quite right!
	        render 'new'
	    end
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

		def checkout
			
		end
end