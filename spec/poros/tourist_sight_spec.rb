require 'rails_helper'

RSpec.describe TouristSight do
  it 'creates a tourist sight object' do
    json_response = File.read("./spec/fixtures/france_tourist_sights.json")
    data = JSON.parse(json_response, symbolize_names: true)[:features].first[:properties]
    tourist_sight = TouristSight.new(data)

    expect(tourist_sight).to be_a TouristSight
    expect(tourist_sight.id).to eq(nil)
    expect(tourist_sight.name).to eq("Tour de l'horloge")
    expect(tourist_sight.address).to eq("Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France")
    expect(tourist_sight.place_id).to eq("51d28de2694b5901405998a9a0ad8afa4640f00102f901db2e6f0d00000000920311546f7572206465206c27686f726c6f6765")
    expect(tourist_sight.instance_variables).to eq([:@id, :@name, :@address, :@place_id])
  end
end