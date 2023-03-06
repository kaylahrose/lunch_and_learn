require 'rails_helper'

RSpec.describe CountriesService do
  it '#get_country_name returns country data' do
    json_response = File.open("./spec/fixtures/all_countries.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})

    country = CountriesService.random_country

    expect(country).to be_a Hash
    expect(country).to have_key(:name)
  end

  it '#get_lat_lng' do
    json_response = File.open("./spec/fixtures/france_details.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/France").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})

    country = CountriesService.get_lat_lng("France")
    expect(country).to be_a Array
    expect(country[0]).to eq(46.0)
    expect(country[1]).to eq(2.0)
  end
end