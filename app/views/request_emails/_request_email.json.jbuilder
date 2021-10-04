json.extract! request_email, :id, :name, :email, :created_at, :updated_at
json.url request_email_url(request_email, format: :json)
