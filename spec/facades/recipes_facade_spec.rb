require 'rails_helper'

RSpec.describe RecipesFacade do
  it 'returns recipe data' do
    recipes = RecipesFacade.get_recipes("thailand")

    expect(recipes).to be_a Array
    expect(recipes.first).to be_a Recipe
  end
end