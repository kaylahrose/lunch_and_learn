require 'rails_helper'

RSpec.describe TouristSightsFacade do
  it '#get_tourist_sights' do
    json_response = File.open("./spec/fixtures/france_details.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/France").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})

    france_tourist_sights = File.open("./spec/fixtures/france_tourist_sights.json") 
    stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{ENV['places_api']}&categories=tourism.sights&filter=circle:2.0,46.0,20000&limit=500").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: france_tourist_sights, headers: {})

    tourist_sights = TouristSightsFacade.get_tourist_sights("France")

    expect(tourist_sights).to be_a Array
    expect(tourist_sights.first).to be_a TouristSight
  end

  it '#create_tourist_sights' do
    france_tourist_sights = File.read("./spec/fixtures/france_tourist_sights.json")  
    data = JSON.parse(france_tourist_sights, symbolize_names: true)
    tourist_sights = TouristSightsFacade.create_tourist_sights(data)

    expect(tourist_sights).to be_a Array
    expect(tourist_sights.first).to be_a TouristSight
  end
end