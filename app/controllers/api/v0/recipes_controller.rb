class Api::V0::RecipesController < ApplicationController
  def index
    unless params[:country] == ""
      recipes = RecipesFacade.get_recipes(params[:country])
    else
      return render json: {"data": []}
    end
    render json: RecipeSerializer.new(recipes)
  end
end