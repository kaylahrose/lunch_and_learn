class RecipesService
  def self.get_recipes(country)
    conn = Faraday.new(url: "https://api.edamam.com")
    response = conn.get("/api/recipes/v2?type=public&q=#{country}&app_id=4cb8d331&app_key=%20431a661eb4d1e63f433650caca60822e")
  end
end