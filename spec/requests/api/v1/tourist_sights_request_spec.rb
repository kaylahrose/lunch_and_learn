require 'rails_helper'

RSpec.describe 'tourist sights API' do
  context 'GET "/api/v1/tourist_sights"' do
    it 'sends a collection of tourist sights' do
      get '/api/v1/tourist_sights?country=France'

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_a Array
    end
  end
end