class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title, :url, :country, :image
  # set_id nil
end
