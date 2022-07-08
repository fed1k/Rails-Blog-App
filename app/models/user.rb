class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts
  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    Post.all.order(created_at: :desc).limit(3)
  end
end
