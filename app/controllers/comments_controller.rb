class CommentsController < ApplicationController
  def index
    redirect_to user_posts_path(current_user)
  end

  def show
    redirect_to user_posts_path(current_user)
  end

  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment.author_id = @user.id
    @comment.post_id = @post.id
    if @comment.save!
      redirect_to user_posts_path(@user)
    else
      render action: 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @user = User.find(params[:user_id])
    redirect_to user_posts_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
