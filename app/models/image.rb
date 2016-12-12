class Image < ApplicationRecord
	belongs_to :product
	validates :product_id, presence: true
		mount_uploader :link, AvatarUploader

end
