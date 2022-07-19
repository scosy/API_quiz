require 'rails_helper'

RSpec.describe 'WrongAnswers', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:wrong_answer, 10)
      get '/api/v1/wrong_answers'
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
      @wrong_answer = FactoryBot.create(:wrong_answer)
      get "/api/v1/wrong_answers/#{@wrong_answer.id}"
      @json = JSON.parse(response.body)
    end

    it 'returns the wrong_answer based on id in url' do
      expect(@json['id']).to eq(@wrong_answer.id)
    end
  end
end
