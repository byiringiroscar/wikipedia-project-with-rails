require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Post Show', type: :feature, js: false do
  before do
    visit user_post_path(2, 464)
  end

  describe 'User Posts Index' do
    let!(:user) { User.find(2) }
    let!(:post) { user.posts.find(464) }

    it 'should display post title' do
      expect(page).to have_content post.title
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content post.user.name
    end

    it 'should have how many comments' do
      expect(page).to have_content("Comments: #{post.comments.count}")
    end

    it 'should have how many likes it has' do
      expect(page).to have_content("Likes: #{post.likes.count}")
    end

    it 'should have the post body' do
      expect(page).to have_content post.text
    end

    it 'I can see the username of each commentator' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'I can see the comment each commentator left' do
      post.comments.each do |comment|
        expected_text = "#{comment.user.name}: #{comment.text}".strip
        expect(page).to have_css('div.comments p', text: expected_text)
      end
    end
  end
end
