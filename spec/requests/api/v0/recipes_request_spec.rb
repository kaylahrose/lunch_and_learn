require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    WebMock.allow_net_connect!
    # json_response = File.open("./spec/fixtures/recipes_thailand.json")
    # stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=thailand&type=public").
    #   with(
    #     headers: {
    #       'App-Id'=>ENV["app_id"],
    #    	  'App-Key'=>ENV["app_key"]}
    #   )
    #   .to_return(status: 200, body: json_response)

    #   require 'pry'; binding.pry
    get '/api/v0/recipes?country=thailand'
    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(recipes).to have_key([:data])
    expect(recipes[:data]).to be_a Array
  end 
end
