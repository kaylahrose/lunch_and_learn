require 'rails_helper'

RSpec.describe Country do
  it 'creates a country object' do
    json_response = File.read("./spec/fixtures/france_details.json")
    data = JSON.parse(json_response, symbolize_names: true)
    france = Country.new(data)

    expect(france).to be_a Country
    expect(france.latitude).to eq(46.0)
    expect(france.longitude).to eq(2.0)
  end
end