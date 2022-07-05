json.extract! comment, :id, :users_id, :posts_id, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
