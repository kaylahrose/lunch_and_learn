require 'rails_helper'

RSpec.describe Recipe do
  it 'creates a recipe object' do
    json_response = File.read("./spec/fixtures/recipes_thailand.json")
    data = JSON.parse(json_response, symbolize_names: true)[:hits].first
    recipe = Recipe.new(data)

    expect(recipe).to be_a Recipe
    expect(recipe.id).to eq(nil)
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.country).to eq("thailand")
    expect(recipe.image).to be_a(String)
    expect(recipe.url).to be_a(String)
    expect(recipe.instance_variables).to eq([:@id, :@title, :@url, :@country, :@image])
  end
end