require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Gabriela', posts_counter: 1) }

  before { subject.save }

  it 'name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'subject should be an instance of the class User' do
    expect(subject).to be_instance_of User
  end

  it 'The method recent_posts should be available for the instance subject' do
    expect(subject).to respond_to(:recent_posts)
  end
end
