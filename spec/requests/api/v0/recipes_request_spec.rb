require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    get '/api/v0/recipes?country=thailand'

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end 
end
