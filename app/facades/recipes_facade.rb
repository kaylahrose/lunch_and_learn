class RecipesFacade
  def self.get_recipes(query)
    response = RecipesService.get_recipes(query)
    recipes = JSON.parse(response.body, symbolize_names: true)[:hits]
    recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end
end