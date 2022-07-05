json.extract! post, :id, :users_id, :title, :text, :comments_id, :likes_id, :created_at, :updated_at
json.url post_url(post, format: :json)
