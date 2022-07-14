class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
    @user = User.find(8)
  end

  def show; end
end
