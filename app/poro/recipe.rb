class Recipe
  attr_reader :id, :title, :url, :country, :image

  def initialize(data, country)
    @id = nil
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    # @country = data[:recipe][:shareAs].split('/')[-1]
    @country = country
    @image = data[:recipe][:image]
  end
end