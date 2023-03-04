class Api::V0::RecipesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.headers["app_key"] = ENV["app_key"]
    end
    
    response = conn.get("/api/recipes/v2?type=public&q=#{params[:country]}")

    json = JSON.parse(response.body, symbolize_names: true)
  end
end