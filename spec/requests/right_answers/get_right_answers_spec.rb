require 'rails_helper'

RSpec.describe 'RightAnswers', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:right_answer, 10)
      get '/api/v1/right_answers'
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
      @right_answer = FactoryBot.create(:right_answer)
      get "/api/v1/right_answers/#{@right_answer.id}"
      @json = JSON.parse(response.body)
    end

    it 'returns the right_answer based on id in url' do
      expect(@json['id']).to eq(@right_answer.id)
    end

    it 'returns status code 200' do 
      expect(response).to have_http_status(:success)
    end
  end
end
