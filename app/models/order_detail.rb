class OrderDetail < ApplicationRecord
	belongs_to :orders
	belongs_to :product_details
end
