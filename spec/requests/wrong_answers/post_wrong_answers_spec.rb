require 'rails_helper'

RSpec.describe 'WrongAnswers', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_wrong_answer) { FactoryBot.build(:wrong_answer) }

      before do
        post '/api/v1/wrong_answers', params:
                          { wrong_answer: {
                            answer: my_wrong_answer.answer,
                            question_id: FactoryBot.create(:question).id
                          } }
      end

      it 'returns the answer' do
        expect(JSON.parse(response.body)['answer']).to eq(my_wrong_answer.answer)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/wrong_answers', params:
                          { wrong_answer: {
                            answer: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
