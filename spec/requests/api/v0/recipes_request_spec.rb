require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    json_response = File.open("./spec/fixtures/recipes_thailand.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=4cb8d331&app_key=%20431a661eb4d1e63f433650caca60822e&q=thailand&type=public").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})

    get '/api/v0/recipes?country=thailand'
    recipes = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(recipes).to have_key(:data)
    expect(recipes[:data]).to be_a Array
  end 
end
