class CommentsController < ApplicationController
  def index
    redirect_to user_posts_path(current_user)
  end

  def show
    redirect_to user_posts_path(current_user)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = 2
    if @comment.save!
      redirect_to user_posts_path(current_user)
    else
      render action: 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
