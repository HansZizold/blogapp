class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all
  end

  def show; end
end
