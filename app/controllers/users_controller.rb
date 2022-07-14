class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all.length
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @comments = Comment.where(post_id: 2)
    @likes = Like.all
  end
end
