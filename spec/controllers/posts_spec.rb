# require 'rails_helper'

# RSpec.describe PostsController, type: :request do
#   describe PostsController do
#     describe '#index' do
#       it 'returns the correct response status' do
#         get user_posts_path(user_id: 1)
#         expect(response).to have_http_status(:success)
#       end

#       it 'renders the index template' do
#         get user_posts_path(user_id: 1)
#         expect(response).to render_template(:index)
#       end

#       it 'includes the correct placeholder text in the response body' do
#         get user_posts_path(user_id: 1)
#         expect(response.body).to include('<h1>Here is full list of posts</h1>')
#       end
#     end

#     describe '#show' do
#       it 'returns the correct response status' do
#         get user_post_path(user_id: 1, id: 1)
#         expect(response).to have_http_status(:success)
#       end

#       it 'renders the show template' do
#         get user_post_path(user_id: 1, id: 1)
#         expect(response).to render_template(:show)
#       end

#       it 'includes the correct placeholder text in the response body' do
#         get user_post_path(user_id: 1, id: 1)
#         expect(response.body).to include('<h1>Here is single post</h1>')
#       end
#     end
#   end
# end
