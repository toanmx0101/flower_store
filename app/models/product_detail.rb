class ProductDetail < ApplicationRecord
	belongs_to :product
	has_many :order_details
end
