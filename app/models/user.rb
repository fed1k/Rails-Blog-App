class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts
  validates :name, presence: true
  validates :posts_counter, presence: true, length: { minimum: 0 }, numericality: { only_integer: true }

  def three_recent_posts
    Post.all.order(created_at: :desc).limit(3)
  end
end
