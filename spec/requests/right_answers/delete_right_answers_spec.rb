require 'rails_helper'

RSpec.describe 'RightAnswers', type: :request do
  describe 'DELETE /destroy' do
    let!(:right_answer) { FactoryBot.create(:right_answer) }

    before do
      delete "/api/v1/right_answers/#{right_answer.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
