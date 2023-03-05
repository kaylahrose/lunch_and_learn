class Api::V0::RecipesController < ApplicationController
  def index
    if params[:country].blank?
      recipes = RecipesFacade.get_recipes(params[:country])
    else
      recipes = []
    end
    render json: RecipeSerializer.new(recipes)
  end
end