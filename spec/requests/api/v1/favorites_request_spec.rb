require 'rails_helper'

RSpec.describe '/api/v1/favorites' do
  it 'creates a favorite object' do
    user = User.create!(name: 'test', email: 'test', api_key: "1234")
    params = {
      "api_key": user.api_key,
      "country": "thailand",
      "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
      "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
    }
    
    post '/api/v1/favorites', params: params
    
    expect(response.status).to eq(201)
    message = JSON.parse(response.body, symbolize_names: true)
    
    expect(message[:success]).to eq("Favorite added successfully")
  end

  it 'returns and error key if api_key invalid' do
    user = User.create!(name: 'test', email: 'test', api_key: "1234")
    params = {
      "api_key": "4321",
      "country": "thailand",
      "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
      "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
    }

    post '/api/v1/favorites', params: params
    
    expect(response.status).to eq(404)
    message = JSON.parse(response.body, symbolize_names: true)
    expect(message[:errors][0][:title]).to eq("Record not found")

  end
  
  it 'gets all users favorites' do
    user = User.create!(name: 'test', email: 'test', api_key: "1234")
    2.times { user.favorites.create!(country: "Thailand", recipe_link: "1234", recipe_title: "1234")}
    get '/api/v1/favorites?api_key=1234'
    favorites = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(favorites[:data].count).to eq(2)
    expect(favorites[:data].first[:type]).to eq("favorite")
  end

  it 'returns and empty array when no favorites found' do
    user = User.create!(name: 'test', email: 'test', api_key: "1234")
    get '/api/v1/favorites?api_key=1234'
    favorites = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(favorites[:data]).to eq([]) 
  end
end