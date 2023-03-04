class Api::V0::RecipesController < ApplicationController
  def index
    # conn = Faraday.new(url: "https://api.edamam.com") do |faraday|
    #   faraday.headers["app_id"] = ENV["app_id"]
    #   faraday.headers["app_key"] = ENV["app_key"]
    # end
    
    conn = Faraday.new(url: "https://api.edamam.com")
    
    # response = conn.get("/api/recipes/v2?type=public&q=#{params[:country]}")
    response = conn.get("/api/recipes/v2?type=public&q=thailand&app_id=4cb8d331&app_key=%20431a661eb4d1e63f433650caca60822e")
    require 'pry'; binding.pry
    render json: RecipeSerializer.new(response.body)
  end
end