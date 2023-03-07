class RecipesFacade
  def self.get_recipes(country)
    data = RecipesService.get_recipes(RecipesFacade.random(country))
    RecipesFacade.create_recipes(data, country)
  end
  
  def self.random(country)
    country ||= CountriesService.random_country[:name][:common]
  end
  
  def self.create_recipes(recipes, country)
    recipes.map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end