require 'rails_helper'

RSpec.describe PlacesService do
  it '#get_tourist_sights returns tourist sight data' do
    france_tourist_sights = File.open("./spec/fixtures/france_tourist_sights.json") 

    stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{ENV['places_api']}&categories=tourism.sights&filter=circle:2.0,46.0,20000&limit=500").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: france_tourist_sights, headers: {})

    france_details = File.read("./spec/fixtures/france_details.json")
    data = JSON.parse(france_details, symbolize_names: true)
    data = PlacesService.get_tourist_sights(46.0, 2.0)

    expect(data).to be_a Hash
    expect(data[:features].first[:properties][:name]).to eq("Tour de l'horloge")
  end
end