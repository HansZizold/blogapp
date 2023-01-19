require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Gabriela', posts_counter: 1)
  post = Post.create(author: user, title: 'Post1', comment_counter: 1, like_counter: 1)
  subject { Comment.create(author: user, post:, text: 'Comment') }

  before { subject.save }

  it 'subject should be an instance of the class Post' do
    expect(subject).to be_instance_of Comment
  end
end
