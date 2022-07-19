require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_question) { FactoryBot.build(:question) }

      before do
        post '/api/v1/questions', params:
                          { question: {
                            question: my_question.question,
                            difficulty: 5,
                            category_id: Category.find_or_create_by(name: 'category').id,
                            right_answer_id: RightAnswer.find_or_create_by(answer: 'answer').id
                          } }
      end

      it 'returns the question' do
        expect(JSON.parse(response.body)['question']).to eq(my_question.question)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/questions', params:
                          { question: {
                            question: '',
                            difficulty: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
