class TouristSightsFacade
  def self.get_tourist_sights(country)
    conn = CountriesService.conn
    response = conn.get("v3.1/name/#{country}")
    
    data = JSON.parse(response.body, symbolize_names: true)
    country = Country.new(data)
    conn = Faraday.new("https://api.geoapify.com")
    response = conn.get("/v2/places?categories=tourism.sights&apiKey=#{ENV['places_api']}&filter=circle:#{country.longitude},#{country.latitude},20000&limit=500")
    data = JSON.parse(response.body, symbolize_names: true)
    
    tourist_sights = data[:features].map do |feature|
      TouristSight.new(feature[:properties])
    end
  end
end