class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @users = User.all
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end
end
