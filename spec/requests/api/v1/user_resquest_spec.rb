require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'creates a new user' do
    params = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
    post '/api/v1/users', params: params
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:id]).to be_a String
    expect(user[:data][:attributes][:name]).to eq("Athena Dao")
    expect(user[:data][:attributes][:email]).to eq("athenadao@bestgirlever.com")
    expect(user[:data][:attributes][:api_key]).to be_a String
  end

  it 'sends an error message for duplicate email' do
    params = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
    post '/api/v1/users', params: params
    params = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
    post '/api/v1/users', params: params
    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(error[:errors][0][:title]).to eq("Validation failed: Email has already been taken")
  end
end