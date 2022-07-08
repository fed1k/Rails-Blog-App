class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter_for_post
    Post.likes_counter += 1
    Post.save
  end
end
