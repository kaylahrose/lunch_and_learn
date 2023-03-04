require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    get '/api/v0/recipes?country=thailand'

    expect(response).to be_successful
    # expect()
  end 
end
