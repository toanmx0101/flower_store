json.extract! admin_bill, :id, :input_price, :selling_price, :product_details_id, :quantity, :created_at, :updated_at
json.url admin_bill_url(admin_bill, format: :json)