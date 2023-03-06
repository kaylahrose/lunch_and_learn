class TouristSightsFacade
  def self.get_tourist_sights(country)
    lat_lng = CountriesService.get_lat_lng(country)
    data = PlacesService.get_tourist_sights(*lat_lng)
    create_tourist_sights(data)
  end

  def self.create_tourist_sights(data)
    tourist_sights = data[:features].map do |feature|
      TouristSight.new(feature[:properties])
    end
  end
end