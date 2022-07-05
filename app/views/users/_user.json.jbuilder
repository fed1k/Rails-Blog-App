json.extract! user, :id, :bio, :name, :postscounter, :photo, :created_at, :updated_at
json.url user_url(user, format: :json)
