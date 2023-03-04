class RecipesService
  def self.get_recipes(country)
    conn = Faraday.new(url: "https://api.edamam.com")
    response = conn.get("/api/recipes/v2?type=public&q=#{country}&app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}")
  end
end