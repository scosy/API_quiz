require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe "DELETE /destroy" do
    let!(:category) { FactoryBot.create(:category) }

    before do
      delete "/api/v1/categories/#{category.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end