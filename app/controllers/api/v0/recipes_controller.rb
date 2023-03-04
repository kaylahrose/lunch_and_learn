class Api::V0::RecipesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.edamam.com")
    
    response = conn.get("/api/recipes/v2?type=public&q=#{params[:country]}&app_id=4cb8d331&app_key=%20431a661eb4d1e63f433650caca60822e")
    recipes = JSON.parse(response.body, symbolize_names: true)
    recipes = recipes[:hits].map do |recipe|
      Recipe.new(recipe) 
    end
    render json: RecipeSerializer.new(recipes)
  end
end