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

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:author, :title, :text))
    author = current_user
    post.author = author

    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(author)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def destroy
    user = User.find(params[:user_id])
    comments = Comment.where(post_id: params[:id])
    comments.each(&:destroy)
    likes = Like.where(post_id: params[:id])
    likes.each(&:destroy)
    post = Post.find(params[:id])
    post.delete

    if post
      flash[:success] = 'Post deleted successfully'
      redirect_to user_posts_path(user)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end
end
