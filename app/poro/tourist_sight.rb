class TouristSight
  attr_reader :id, :name, :address, :place_id
  def initialize(data)
    @id = nil
    @name = data[:name]
    @address = data[:formatted]
    @place_id = data[:place_id]
  end
end