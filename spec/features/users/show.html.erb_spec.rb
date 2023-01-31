require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Gaby',
      photo: 'bulma.jpg',
      bio: 'Systems Engineering Student'
    )
    @post1 = Post.create(author: @user, title: 'Post 1', text: 'Post One')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'Post Two')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'Post Three')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'Post Four')
    @posts = [post2, post3, post4]
    @posts_url = "a[href = '#{user_posts_path(@user.id)}']"

    visit user_path(@user.id)
  end

  it 'shows the right content' do
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    expect(page).to have_content(@user.bio)
  end

  it 'shows the first three posts' do
    expect(page).to_not have_content(@post1.title)
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'check the prescence of the posts button' do
    button = find("#{@posts_url} button")
    expect(button).to have_text('See all posts')
    expect(page).to have_selector(@posts_url)
  end

  it 'changes to post page after clicking on the See all posts button' do
    find(@posts_url).click
    expect(page).to have_content('Pagination')
  end
end
