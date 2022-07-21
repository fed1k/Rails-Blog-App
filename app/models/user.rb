class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: :author_id
  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  devise :registerable, :recoverable, :validatable, :confirmable

  def three_recent_posts
    Post.all.order(created_at: :desc).limit(3)
  end
end
