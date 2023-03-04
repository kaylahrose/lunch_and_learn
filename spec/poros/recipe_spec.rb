require 'rails_helper'

RSpec.describe Recipe do
  it 'creates a recipe object' do
    json_reponse = File.open("./spec/fixtures/recipe_thailand.json")
    data = JSON.parse(json_response, symbolize_names: true)

    recipe = Recipe.new(data)

    expect(recipe).to be_a Recipe
    expect(recipe.id).to eq(nil)
    expect(recipe.title).to eq()
  end
end