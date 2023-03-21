class LikesController < ApplicationController
  def create
    like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    post = Post.find(params[:post_id])

    if like.save
      flash[:success] = 'Like added successfully'
    else
      flash.now[:error] = 'Error: Like could not be added'
    end
    redirect_to user_post_path(current_user, post)
  end
end
