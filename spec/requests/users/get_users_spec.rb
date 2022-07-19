require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:user, 10)
      get '/api/v1/users'
      @json = JSON.parse(response.body)
    end

    it 'returns all users' do
      expect(@json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show/1' do
    before do
      @user = FactoryBot.create(:user)
      get "/api/v1/users/#{@user.id}"
      @json = JSON.parse(response.body)
    end

    it 'returns the user based on id in url' do
      expect(@json['id']).to eq(@user.id)
    end
  end
end
