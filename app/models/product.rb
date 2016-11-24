class Product < ApplicationRecord
	belongs_to :category
	has_many :product_details
	has_many :images
	has_many :specials
end
