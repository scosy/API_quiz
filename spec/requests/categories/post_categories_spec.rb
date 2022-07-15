require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_category) { FactoryBot.build(:category) }

      before do
        post '/api/v1/categories', params:
                          { category: {
                            name: my_category.name
                          } }
      end

      it 'returns the name' do
        expect(JSON.parse(response.body)['name']).to eq(my_category.name)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/categories', params:
                          { category: {
                            name: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
