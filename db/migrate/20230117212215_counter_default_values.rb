class CounterDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_counter, 0
    change_column_default :posts, :comment_counter, 0
    change_column_default :posts, :like_counter, 0
  end
end
