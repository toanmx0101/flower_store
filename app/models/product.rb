class Product < ActiveRecord::Base
	TYPES = ['Nomal', 'Small',  'Large',]

	belongs_to :category
	has_many :product_details
	has_many :images, dependent: :destroy
	has_many :specials
	has_many :featureds
	mount_uploader :image, AvatarUploader
end
