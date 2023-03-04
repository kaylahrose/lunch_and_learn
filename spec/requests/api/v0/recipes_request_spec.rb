require 'rails_helper'

describe 'Recipes API' do
  it 'sends a list of recipes' do
    get '/api/v0/recipes'

    expect(response).to be_successful
  end 
end
