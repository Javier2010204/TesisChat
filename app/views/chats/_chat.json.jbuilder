json.extract! chat, :id, :user_id, :professional_id, :status, :created_at, :updated_at
json.url chat_url(chat, format: :json)
