require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      title: 'Post title',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      author_id: 1,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when comments_counter is string' do
    subject.comments_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'is not valid when likes_counter is string' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end
  it 'is not valid when title exceeds 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end
  it 'is not valid when comments_counter is less than zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid when comments_counter is zero' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'is valid when comments_counter is positive' do
    subject.comments_counter = 5
    expect(subject).to be_valid
  end
  it 'is not valid when likes_counter is less than zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid when likes_counter is zero' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'is valid when likes_counter is positive' do
    subject.likes_counter = 10
    expect(subject).to be_valid
  end
end
