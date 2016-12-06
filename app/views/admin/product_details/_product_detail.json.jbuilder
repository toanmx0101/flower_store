json.extract! admin_product_detail, :id, :type_product, :product_id, :code, :price, :new, :discount, :created_at, :updated_at
json.url admin_product_detail_url(admin_product_detail, format: :json)