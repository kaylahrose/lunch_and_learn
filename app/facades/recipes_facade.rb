class RecipesFacade
  def self.get_recipes(country)
    response = RecipesService.get_recipes(country)
    recipes = JSON.parse(response.body, symbolize_names: true)[:hits]
    recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end
end