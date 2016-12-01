json.extract! admin_comment, :id, :content, :user_id, :comment_id, :created_at, :updated_at
json.url admin_comment_url(admin_comment, format: :json)