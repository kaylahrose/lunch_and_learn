class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    render json: FavoriteSerializer.new(user.favorites)
  end

  def create
    user = User.find_by!(api_key: params[:api_key])
    user.favorites.create!(favorite_params)
    render json: {success: "Favorite added successfully"}, status: :created
  end

  private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end