class Api::V1::TouristSightsController < ApplicationController
  def index
    conn = CountriesService.conn
    response = conn.get("v3.1/name/#{params[:country]}")
    
    data = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end