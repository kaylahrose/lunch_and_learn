require 'rails_helper'

RSpec.describe 'POST /api/v1/favorites' do
  it 'creates a favorite object' do
    user = User.create!(name: 'test', email: 'test', api_key: SecureRandom.hex(10))
    params = {
      "api_key": user.api_key,
      "country": "thailand",
      "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
      "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
    }

    post '/api/v1/favorites', params: params
    
    expect(response.status).to eq(201)
    expect(message[:success]).to eq("Favorite added successfully")
  end
end