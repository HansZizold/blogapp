class CommentsController < ApplicationController
  def create
    comment = Comment.new(params.require(:comment).permit(:author, :post, :text))
    author = current_user
    comment.author = author
    post = Post.find(params[:post_id])
    comment.post = post
    comment.inc_comments_counter

    if comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
    redirect_to user_post_path(author, post)
  end

  def destroy
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.dec_comments_counter
    comment.delete

    if comment
      flash[:success] = 'Comment deleted successfully'
    else
      flash.now[:error] = 'Error: Comment could not be delete'
    end
    redirect_to user_post_path(user, post)
  end
end
