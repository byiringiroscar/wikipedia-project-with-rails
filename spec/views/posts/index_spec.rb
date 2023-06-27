require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User Posts Index', type: :feature, js: false do
    before do
        visit user_posts_path(2)
    end
    describe 'User Posts Index' do
        let!(:user) { User.find(2) }
        let!(:posts) { user.posts }

        it 'should display user photo' do
            expect(page).to have_css("img[src='#{user.photo}']")
        end
        it 'should display user name' do
            expect(page).to have_content user.name
        end
        it 'should display number of posts for the user' do
            expect(page).to have_content("Number of Posts: #{posts.count}")
        end
        it 'should display post titles' do
            posts.each { |post| expect(page).to have_content post.title }
        end
        it 'should display post bodies' do
            posts.each { |post| expect(page).to have_content post.text }
        end
        it 'should display the first comments on each post' do
            posts.each do |post|
              comments = post.comments.first(3)
              comments.each { |comment| expect(page).to have_content("#{comment.user.name}: #{comment.text}") }
            end
        end
        it 'should display the number of comments for each post' do
            posts.each { |post| expect(page).to have_content("Comments: #{post.comments.count}") }
        end
        it 'should display the number of likes for each post' do
            posts.each { |post| expect(page).to have_content("Likes: #{post.likes.count}") }
        end
        it 'should display pagination if there are more posts than fit on the view' do
            expect(page).to have_css('.pagination-btn')
          end
        it 'should redirect to post show page when a post is clicked' do
            post = posts.find_by(title: 'zubi')
            find('.single-post', match: :first).click
            expect(page).to have_current_path(user_post_path(user, post))
        end
    end
end