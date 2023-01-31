require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    user1 = User.create(
      name: 'Gaby',
      photo: 'bulma.jpg',
      bio: 'Systems Engineering Student'
    )
    user2 = User.create(
      name: 'Leo',
      photo: 'vegeta.jpg',
      bio: 'Law Student'
    )
    @users = [user1, user2]
    @user1_url = "a[href = '#{user_path(user1.id)}']"
    @user2_url = "a[href = '#{user_path(user2.id)}']"

    visit users_path
  end

  it 'shows the right content' do
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it "When I click on a user, I am redirected to that user's show page" do
    find(@user1_url).click
    expect(page).to have_content('Systems Engineering Student')
  end

  it "When I click on a user, I am redirected to that user's show page" do
    find(@user2_url).click
    expect(page).to have_content('Law Student')
  end
end
