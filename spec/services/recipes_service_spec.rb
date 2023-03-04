require 'rails_helper'

RSpec.describe RecipesService do
  it 'returns recipes data' do
    response = RecipesService.get_recipes(query)

    expect(response).to be_successful
    expect(response.status).to eq 200
    recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes[:data]).to be_a Array
  end
end