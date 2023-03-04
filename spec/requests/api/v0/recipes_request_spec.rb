require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    get '/api/v0/recipes?country=thailand'

    stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=thailand&type=public").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'App-Id'=>'4cb8d331',
       	  'App-Key'=>'431a661eb4d1e63f433650caca60822e',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: "", headers: {})

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end 
end
