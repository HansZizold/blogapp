class LikesController < ApplicationController
  def create
    like = Like.new
    author = current_user
    like.author = author
    post = Post.find(params[:post_id])
    like.post = post

    if like.save
      flash[:success] = 'Like added successfully'
    else
      flash.now[:error] = 'Error: Like could not be added'
    end
    redirect_to user_post_path(author, post)
  end
end
