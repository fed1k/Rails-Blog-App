class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def five_recent_comments
    Comment.all.order(created_at: :desc).limit(5)
  end

  def update_posts_count
    User.posts_counter += 1
    User.save
  end
end
