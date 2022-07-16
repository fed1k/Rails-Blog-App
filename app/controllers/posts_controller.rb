class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
    @user = User.where(id: 8)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: 2, author_id: 8)
  end

  def new
    post = Post.new
    @user = current_user
  end

  def create
    @post = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render action: "new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
