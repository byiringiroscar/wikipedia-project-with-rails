require 'rails_helper'
require 'capybara/rspec'


RSpec.describe 'User Show', type: :feature, js: false do
  before do
    visit user_path(2)
  end

  describe 'User Show' do
    let!(:user) { User.find(2) }

    it 'should display user photo' do
      expect(page).to have_css("img[src='#{user.photo}']")
    end

    it 'should display user name' do
      expect(page).to have_content user.name
    end


    it 'should display number of posts for each user' do
      expect(page).to have_content("Number of Posts: #{user.posts.count}")
    end

    it 'displays the user bio' do
      expect(page).to have_content(user.bio)
    end
    it 'displays the user first 3 posts' do
      user.posts.limit(3).each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end
    it 'displays a button to view all of the user\'s posts' do
      expect(page).to have_link('See All Posts', href: user_posts_path(user))
    end
    it 'redirects to the post show page when a user\'s post is clicked' do
      post = user.posts.first
      find('.post', match: :first).click
      expected_path = user_post_path(user, post)
      expect(page).to have_current_path(expected_path)
    end
    it 'redirects to the user post index page when "See All Posts" is clicked' do
      click_link 'See All Posts'
      expected_path = user_posts_path(user)
      expect(page).to have_current_path(expected_path)
    end
  end
end
