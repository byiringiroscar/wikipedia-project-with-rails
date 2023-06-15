require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      author_id: 1,
      post_id: 1
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid when author_id is string' do
    subject.author_id = 'string'
    expect(subject).to_not be_valid
  end

  it 'is not valid when post_id is string' do
    subject.post_id = 'string'
    expect(subject).to_not be_valid
  end
end
