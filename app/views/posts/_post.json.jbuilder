json.extract! post, :id, :post_type_id, :title, :post_text, :created_at, :updated_at
json.url post_url(post, format: :json)
