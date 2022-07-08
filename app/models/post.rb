class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, length: { minimum: 0 }, numericality: { only_integer: true }
  validates :likes_counter, presence: true, length: { minimum: 0 }, numericality: { only_integer: true }

  def five_recent_comments
    Comment.all.order(created_at: :desc).limit(5)
  end

  def update_posts_count
    User.posts_counter += 1
    User.save
  end
end
