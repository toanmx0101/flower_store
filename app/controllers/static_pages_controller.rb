class StaticPagesController < ApplicationController
  def home
    @featured = Featured.first
    @featured1 = Product.where(id: @featured.product_id).all
    @featured = Featured.second
    @featured2 = Product.where(id: @featured.product_id).all
    @featured = Featured.third
    @featured3 = Product.where(id: @featured.product_id).all
    @featured = Featured.fourth
    @featured4 = Product.where(id: @featured.product_id).all


  	@specials = Special.first
    @products = Product.where(id: @specials.product_id).all
    @specials = Special.second
    @product2 = Product.where(id: @specials.product_id).all
    @specials = Special.third
    @product3 = Product.where(id: @specials.product_id).all
    @specials = Special.fourth
    @product4 = Product.where(id: @specials.product_id).all
  end
  def about
  	
  end
  def login
  	
  end
  def contact
  end

  def help
  end
end
