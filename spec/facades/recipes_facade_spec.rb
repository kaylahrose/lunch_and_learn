require 'rails_helper'

RSpec.describe RecipesFacade do
  it 'returns recipe data' do
    json_response = File.open("./spec/fixtures/recipes_thailand.json")

    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=4cb8d331&app_key=%20431a661eb4d1e63f433650caca60822e&q=thailand&type=public").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
    query = "thailand"
    recipes = RecipesFacade.get_recipes("thailand")

    expect(recipes).to be_a Array
    expect(recipes.first).to be_a Recipe
    expect(recipes.first.title).to be_a String
    expect(recipes.first.url).to be_a String
    expect(recipes.first.country).to be_a String
    expect(recipes.first.image).to be_a String
  end
end