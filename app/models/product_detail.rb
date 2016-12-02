class ProductDetail < ApplicationRecord
	belongs_to :products
	has_many :order_details
end
