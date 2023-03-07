class RecipesService
  def self.conn
    Faraday.new(url: "https://api.edamam.com")
  end
  
  def self.get_recipes(country)
    response = conn.get("/api/recipes/v2?type=public&q=#{country}&app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}")
    JSON.parse(response.body, symbolize_names: true)[:hits]
  end
end