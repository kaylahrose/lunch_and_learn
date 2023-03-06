require 'rails_helper'

RSpec.describe 'GET /api/v0/learning_resources' do
  it 'sends learning data for a country' do
    get '/api/v0/learning_resources?country=laos'
    learning = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response[:data][:id]).to eq(nil)
    expect(response[:data][:type]).to eq("learning_resource")
    expect(response[:data][:attributes][:country]).to eq("laos")
    expect(response[:data][:attributes][:video][:title]).to eq("A Super Quick History of Laos")
    expect(response[:data][:attributes][:video][:youtube_video_id]).to eq("uw8hjVqxMXw")
    expect(response[:data][:attributes][:images].first[:alt_tag]).to eq("standing statue and temples landmark during daytime")
    expect(response[:data][:attributes][:images].first[:url]).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3")
  end
end