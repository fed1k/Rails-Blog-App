class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_comments_counter_for_post
    Post.increment!(:comments_counter)
  end
end
