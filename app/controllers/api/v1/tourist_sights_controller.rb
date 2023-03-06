class Api::V1::TouristSightsController < ApplicationController
  def index
    conn = CountriesService.conn
    response = conn.get("v3.1/name/#{params[:country]}")
    
    data = JSON.parse(response.body, symbolize_names: true)
    country = Country.new(data)
    conn = Faraday.new("https://api.geoapify.com")
    response = conn.get("/v2/places?categories=tourism.sights&apiKey=8cb8b106c84c4e028afa60ec6c356327&filter=circle:2.0,46.0,20000")
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end