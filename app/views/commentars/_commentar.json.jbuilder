json.extract! commentar, :id, :user_id, :comentar_text, :created_at, :updated_at
json.url commentar_url(commentar, format: :json)
