require 'rails_helper'

RSpec.describe 'WrongAnswers', type: :request do
  describe 'DELETE /destroy' do
    let!(:wrong_answer) { FactoryBot.create(:wrong_answer) }

    before do
      delete "/api/v1/wrong_answers/#{wrong_answer.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
