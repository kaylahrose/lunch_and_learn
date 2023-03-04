class RecipesFacade
  def self.get_recipes(query)
    response = RecipesService.get_recipes
    recipes = JSON.parse(response.body, symbolize_names: true)[:data]
    recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end
end