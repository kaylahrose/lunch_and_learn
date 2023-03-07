class ImagesService
  def self.conn
    Faraday.new("https://api.unsplash.com")
  end

  def self.get_images(country)
    response = conn.get("/search/photos?client_id=#{ENV['unsplash_key']}&query=#{country}")
    data = JSON.parse(response.body, symbolize_names: true)[:results].first(10)
  end
end