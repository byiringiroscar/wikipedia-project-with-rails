require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://example.com/photo.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      posts_counter: 0
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a negative posts_counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with a posts_counter equal to zero' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'is valid with a positive posts_counter' do
    subject.posts_counter = 5
    expect(subject).to be_valid
  end
end
