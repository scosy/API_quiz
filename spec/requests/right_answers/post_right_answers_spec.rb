require 'rails_helper'

RSpec.describe 'RightAnswers', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_right_answer) { FactoryBot.build(:right_answer) }

      before do
        post '/api/v1/right_answers', params:
                          { right_answer: {
                            answer: my_right_answer.answer
                          } }
      end

      it 'returns the answer' do
        expect(JSON.parse(response.body)['answer']).to eq(my_right_answer.answer)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/right_answers', params:
                          { right_answer: {
                            answer: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
