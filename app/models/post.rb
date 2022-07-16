class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250, too_long: 'Name must not exceed 250 characters' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_recent_comments
    Comment.all.order(created_at: :desc).limit(5)
  end

  def update_posts_count
    User.posts_counter += 1
    User.save
  end
end
