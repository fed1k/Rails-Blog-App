class Api::PostsController < ApplicationController
  before_action :require_login

  def index
    posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
    render json: { posts: posts }, status: :ok
  end
end
