require 'rails_helper'

RSpec.describe RecipesService do
  it 'returns recipes data' do
    json_response = File.open("./spec/fixtures/recipes_thailand.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}&q=thailand&type=public").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
    query = "thailand"
    recipes = RecipesService.get_recipes(query)
    # recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes).to be_a Array
  end
end