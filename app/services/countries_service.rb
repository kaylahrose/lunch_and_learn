class CountriesService
  def self.conn
    Faraday.new("https://restcountries.com/")
  end

  def self.random_country
    response = conn.get("/v3.1/all")
    JSON.parse(response.body, symbolize_names: true).sample
  end

  def self.get_lat_lng(country)
    response = conn.get("v3.1/name/#{country}")
    data = JSON.parse(response.body, symbolize_names: true).first[:latlng]
  end
end