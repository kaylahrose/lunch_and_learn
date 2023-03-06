class TouristSightsFacade
  def self.get_tourist_sights(country)
    country = CountriesService.get_lat_lng(country)
    data = PlacesService.get_tourist_sights(country)
    create_tourist_sights(data)
  end

  def self.create_tourist_sights(data)
    tourist_sights = data[:features].map do |feature|
      TouristSight.new(feature[:properties])
    end
  end
end