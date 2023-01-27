class CommentsController < ApplicationController
  def create
    comment = Comment.new(params.require(:comment).permit(:author, :post, :text))
    author = current_user
    comment.author = author
    post = Post.find(params[:post_id])
    comment.post = post

    if comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
    redirect_to user_post_path(author, post)
  end
end
