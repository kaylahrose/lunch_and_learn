class Recipe
  attr_reader :id, :title, :url, :country, :image

  def initialize(data)
    @id = nil
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @country = data[:recipe][:shareAs].split('/')[-1]
    @image = data[:recipe][:image]
  end
end