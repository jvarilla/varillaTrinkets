json.extract! email_message, :id, :page_id, :integer, :subject, :message, :created_at, :updated_at
json.url email_message_url(email_message, format: :json)
