require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'creates a new user' do
    params = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
    post '/api/v1/users', params: params

    expect(response.status).to eq 201
    
  end
end