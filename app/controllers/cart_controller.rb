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

	def add_address
		add_address_order
	end

	def add_comment_order
		add_comment
	end

	def confirm_order
		confirm
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

		def add_address_order
			if params[:payment_address] == "existing"
				session[:address] = params[:session][:address]
			else
				session[:name] = params[:session][:new_name]
				session[:address] = params[:session][:new_name]
				session[:phonenumber] = params[:session][:new_phonenumber]
			end		
			redirect_to checkout_step3_path
		end

		def add_comment
			session[:comment] =  params[:comment]
			redirect_to checkout_step4_path
		end

		def confirm
			order = current_user.orders.create requirement: session[:comment], phonenumber:  session[:address]
			
			(get_json_cart session[:current_cart]).each do |p|
				order.order_details.create  product_detail_id: p[:product_detail_id]  ,product_name: p[:name],product_type: p[:type],  product_details_code: p[:code], quantity: p[:count], price: p[:current_price]
				session[:current_cart].clear					
			end			      
			redirect_to checkout_success_path
		end	

		def get_json_cart cart
			products = ProductDetail.find cart.keys
			products.map{|e| get_json_product(e, cart[e.id.to_s])}
		end

		def get_json_product product_detail, count
			cur_price = product_detail.price*(1 - product_detail.discount/100)
			{product_detail_id: product_detail.id ,name: product_detail.product.name, type: product_detail.type_product,
				code: product_detail.code, current_price: cur_price, count: count}
		end


end