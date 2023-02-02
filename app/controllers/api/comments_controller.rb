class Api::CommentsController < ApplicationController
  def index
    comments = Post.find(params[:post_id]).comments

    render json: comments.select(:id, :text, :author_id, :post_id)
  end

  def create
    comment = Comment.create(text: params[:text], author: User.find(params[:user_id]),
                             post: Post.find(params[:post_id]))
    comment.inc_comments_counter

    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
