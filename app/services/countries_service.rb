class CountriesService
  def self.conn
    Faraday.new("https://restcountries.com/")
  end

  def self.random_country
    response = conn.get("/v3.1/all")
    JSON.parse(response.body, symbolize_names: true).sample
  end
end