class StaticPagesController < ApplicationController
  def home
  	@specials = Special.first
    @product_specials = Product.where(id: @specials.product_id).all
  end
  def about
  	
  end
  def login
  	
  end
  def contact
  	
  end
  def help
  	
  end
  def setting
    
  end
end
