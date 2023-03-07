class Favorite < ApplicationRecord
  belongs_to :user
  validates :recipe_title, :recipe_link, :country, presence: true
end
