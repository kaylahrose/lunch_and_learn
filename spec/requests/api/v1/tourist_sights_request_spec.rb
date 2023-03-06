require 'rails_helper'

RSpec.describe 'tourist sights API' do
  context 'GET "/api/v1/tourist_sights"' do
    it 'sends a collection of tourist sights' do
      WebMock.allow_net_connect!
      # stub_request(:get, "https://restcountries.com/v3.1/name/France").
      # with(
      #   headers: {
      #   'Accept'=>'*/*',
      #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #   'User-Agent'=>'Faraday v2.7.4'
      #   }).
      # to_return(status: 200, body: "", headers: {})
  

      get '/api/v1/tourist_sights?country=France'

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_a Array
    end
  end
end