require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user = User.create(name: 'Gaby', photo: 'bulma.jpg', bio: 'Systems Engineering Student')
    @post = Post.create(author: @user, title: 'Post From Gaby', text: 'Funny Post')

    visit user_post_path(@user.id, @post.id)
  end

  it 'shows a post title and the author' do
    title_element = find('.commentpost')
    expect(title_element).to have_content("Post #{@post.id}: #{@post.title} by #{@user.name}")
  end

  it 'shows how many comments and likes the post has' do
    expect(page).to have_content("Comments: #{@post.comment_counter}, Likes: #{@post.like_counter}")
  end

  it 'shows the post body' do
    post_text = find('.postcommenttext')
    expect(post_text).to have_content(@post.text[..200].to_s)
  end

  it 'shows username of post commentors' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(@user[comment.author_id].name)
    end
  end

  it 'shows comments of each commentors' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
