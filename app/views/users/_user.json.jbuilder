json.extract! user, :id, :name, :habilitaded, :registration, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
