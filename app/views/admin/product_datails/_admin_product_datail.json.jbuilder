json.extract! admin_product_datail, :id, :color, :type, :product_id, :code, :quantity, :created_at, :updated_at
json.url admin_product_datail_url(admin_product_datail, format: :json)