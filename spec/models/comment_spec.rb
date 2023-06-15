require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(
      author_id: 1,
      post_id: 1,
      text: 'text'
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
