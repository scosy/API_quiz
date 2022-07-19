require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_user) { FactoryBot.build(:user) }

      before do
        post '/api/v1/users', params:
                          { user: {
                            username: my_user.username,
                            email: my_user.email,
                            password_digest: my_user.password_digest
                          } }
      end

      it 'returns the name' do
        expect(JSON.parse(response.body)['username']).to eq(my_user.username)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/users', params:
                          { user: {
                            username: '',
                            email: 'email'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
