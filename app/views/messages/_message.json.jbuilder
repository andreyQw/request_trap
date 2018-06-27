json.extract! message, :id, :text, :user_name, :created_at, :updated_at
json.url message_url(message, format: :json)
