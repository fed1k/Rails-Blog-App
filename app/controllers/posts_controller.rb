class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:comments])
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: 2, author_id: 8)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render action: 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.destroy_all
    @like = @post.likes.destroy_all
    @post.destroy
    redirect_to user_posts_path(8)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
