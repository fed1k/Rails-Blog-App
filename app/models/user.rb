class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def three_recent_posts
    Post.all.order(created_at: :desc).limit(3)
  end
end
