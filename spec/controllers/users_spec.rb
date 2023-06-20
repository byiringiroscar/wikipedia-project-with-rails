require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe UsersController do
    describe '#index' do
      it 'returns the correct response status' do
        get users_path
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it 'includes the correct placeholder text in the response body' do
        get users_path
        expect(response.body).to include('<h1>Here is full of users</h1>')
      end
    end
  end
end
