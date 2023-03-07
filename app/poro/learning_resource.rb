class LearningResource
  attr_reader :id, :country, :video, :images
  
  def initialize(country, video, images)
    @id = nil
    @country = country
    @video = video
    @images = images
  end

  def format(resour)
    require 'pry'; binding.pry
  end
end