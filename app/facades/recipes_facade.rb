class RecipesFacade
  def self.get_recipes(country = random)
    recipes = RecipesService.get_recipes(country)
    recipes.map do |recipe|
      Recipe.new(recipe, country)
    end
  end

  def self.random_country
    response = CountriesService.get_country
    
  end
end