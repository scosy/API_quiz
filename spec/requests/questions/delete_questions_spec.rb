require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'DELETE /destroy' do
    let!(:question) { FactoryBot.create(:question) }

    before do
      delete "/api/v1/questions/#{question.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
