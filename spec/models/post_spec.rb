require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Gabriela', posts_counter: 1)
  subject { Post.create(author: user, title: 'Post1', comment_counter: 1, like_counter: 1) }

  before { subject.save }

  it 'title must not be blankcharacters' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'PostNumber1'
    expect(subject).to be_valid
  end

  it 'comment_counter must be an integer equal or greater than zero' do
    subject.comment_counter = -1
    expect(subject).to_not be_valid
  end

  it 'like_counter must be an integer equal or greater than zero' do
    subject.like_counter = -1
    expect(subject).to_not be_valid
  end

  it 'subject should be an instance of the class Post' do
    expect(subject).to be_instance_of Post
  end

  it 'The method recent_comments should be available for the instance subject' do
    expect(subject).to respond_to(:recent_comments)
  end
end
