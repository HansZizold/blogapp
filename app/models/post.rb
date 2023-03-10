class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).first(5)
  end

  def inc_posts_counter
    author.increment!(:posts_counter)
  end

  def dec_posts_counter
    author.decrement!(:posts_counter)
  end
end
