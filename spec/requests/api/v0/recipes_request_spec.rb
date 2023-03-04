require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=thailand&type=public").
      with(
        headers: {
          'App-Id'=>ENV["app_id"],
       	  'App-Key'=>ENV["app_key"]}
      )
      .to_return(status: 200, body: "", headers: {})

    get '/api/v0/recipes?country=thailand'

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end 
end
