class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
    @user = User.find(8)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: 2, author_id: 8)
  end
end
