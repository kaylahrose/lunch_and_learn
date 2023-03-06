class Country
  def initialize(data)
    @name = data.first[:name][:common]
    @latitude = data.first[:latlng].first 
    @longitude = data.first[:latlng][-1]
  end
end