json.extract! admin_review, :id, :user_id, :product_id, :created_at, :updated_at
json.url admin_review_url(admin_review, format: :json)