require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Gabriela', posts_counter: 1)
  post = Post.create(author: user, title: 'Post1', comment_counter: 1, like_counter: 1)
  subject { Like.create(author: user, post:) }

  before { subject.save }

  it 'subject should be an instance of the class Post' do
    expect(subject).to be_instance_of Like
  end
end
