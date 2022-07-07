class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter_for_post
    Post.comments_counter += 1
    Post.save
  end
end
