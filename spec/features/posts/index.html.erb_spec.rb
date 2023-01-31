require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @user = User.create(name: 'Gaby', photo: 'bulma.jpg', bio: 'Systems Engineering Student')

    @post1 = Post.create(author: @user, title: 'Post 1', text: 'Post One')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'Post Two')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'Post Three')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'Post Four')
    @posts = [@post1, post2, post3, post4]

    visit user_posts_path(@user.id)
  end

  it "shows user's profile picture" do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
  end

  it "shows the user's username" do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts the user has written.' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'shows a post title' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'shows part of the post body' do
    @posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'displays the first comments in a post' do
    comments = @post1.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'shows comments and likes counts' do
    expect(page).to have_content("Comments: #{@post1.comment_counter}, Likes: #{@post1.like_counter}")
  end

  it 'check for the pagination button' do
    button = find('.pagination')
    expect(button).to have_text('Pagination')
  end

  it 'redirects to the post show page after clicking a post' do
    click_link(@post1.title)
    expect(page).to have_selector("input[type=submit][value='Delete Post']")
    expect(page).to have_selector("input[type=submit][value='Like']")
  end
end
