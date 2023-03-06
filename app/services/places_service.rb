class PlacesService
  def self.conn
    conn = Faraday.new("https://api.geoapify.com")
  end

  def self.get_tourist_sights(lat, lng)
    response = conn.get("/v2/places?categories=tourism.sights&apiKey=#{ENV['places_api']}&filter=circle:#{lng},#{lat},20000&limit=500")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end