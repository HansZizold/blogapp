class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def inc_comments_counter
    post.increment!(:comment_counter)
  end

  def dec_comments_counter
    post.decrement!(:comment_counter)
  end
end
