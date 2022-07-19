require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:question, 10)
      get '/api/v1/questions'
      @json = JSON.parse(response.body)
    end

    it 'returns all posts' do
      expect(@json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show/1' do
    before do
      @question = FactoryBot.create(:question)
      get "/api/v1/questions/#{@question.id}"
      @json = JSON.parse(response.body)
    end

    it 'returns the question based on id in url' do
      expect(@json['id']).to eq(@question.id)
    end
  end
end
