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
      tourist_sights = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(tourist_sights).to have_key(:data)
      expect(tourist_sights[:data].first[:id]).to eq(nil)
      expect(tourist_sights[:data].first[:type]).to eq("tourist_sight")
      expect(tourist_sights[:data].first[:attributes][:name]).to eq("Tour de l'horloge")
      expect(tourist_sights[:data].first[:attributes][:address]).to eq("Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France")
      expect(tourist_sights[:data].first[:attributes][:place_id]).to eq("51d28de2694b5901405998a9a0ad8afa4640f00102f901db2e6f0d00000000920311546f7572206465206c27686f726c6f6765")
    end
  end
end