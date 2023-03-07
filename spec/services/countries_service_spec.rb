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
end