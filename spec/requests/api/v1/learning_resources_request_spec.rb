require 'rails_helper'

RSpec.describe 'GET /api/v1/learning_resources' do
  it 'sends learning data for a country' do
    # WebMock.allow_net_connect!
    laos_videos = File.open("./spec/fixtures/laos_videos.json")
    
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['yt_key']}&part=snippet&q=laos%7D&type=video").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }).
        to_return(status: 200, body: laos_videos, headers: {})

    laos_photos = File.open("./spec/fixtures/laos_photos.json")
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unsplash_key']}&query=laos").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }).
        to_return(status: 200, body: laos_photos, headers: {})
        
    get '/api/v1/learning_resources?country=laos'
    resource = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(resource[:data][:id]).to eq(nil)
    expect(resource[:data][:type]).to eq("learning_resource")
    expect(resource[:data][:attributes][:country]).to eq("laos")
    expect(resource[:data][:attributes][:video][:title]).to eq("A Super Quick History of Laos")
    expect(resource[:data][:attributes][:video][:youtube_video_id]).to eq("uw8hjVqxMXw")
    expect(resource[:data][:attributes][:images].first[:alt_tag]).to eq("time lapse photography of flying hot air balloon")
    expect(resource[:data][:attributes][:images].first[:url]).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=Mnw0MTkyNjh8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY3ODE0MTcxNw&ixlib=rb-4.0.3")
  end
      
  it 'sends empty image and video objects when no results found' do
    videos = File.open("./spec/fixtures/no_videos.json")
    stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=AIzaSyDh_ORkiY6NnXRFIg-KhDL4i9TXeY--BkM&part=snippet&q=lslkjaf%7D&type=video").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }).
        to_return(status: 200, body: videos, headers: {})
        
    photos = File.open("./spec/fixtures/no_photos.json")
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=dG0sY2J-S4eyBDBbHUA1xBvGZ5fjc0tjKTDn7V_VqSU&query=lslkjaf").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: photos, headers: {})


    get '/api/v1/learning_resources?country=lslkjaf'
    resource = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(resource[:data][:id]).to eq(nil)
    expect(resource[:data][:type]).to eq("learning_resource")
    expect(resource[:data][:attributes][:country]).to eq("lslkjaf")
    expect(resource[:data][:attributes][:video].empty?).to be true
    expect(resource[:data][:attributes][:images].empty?).to be true
  end
end