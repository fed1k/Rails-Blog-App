class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def five_recent_comments
    Comment.all.order(created_at: :desc).limit(5)
  end

  def update_posts_count
    User.update(posts_counter: posts_counter += 1)
  end
end
