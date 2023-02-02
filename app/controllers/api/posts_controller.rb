class Api::PostsController < ApplicationController
  def index
    posts = Post.where(author_id: params[:user_id])

    render json: posts.select(:id, :title, :text, :comment_counter, :like_counter)
  end
end
