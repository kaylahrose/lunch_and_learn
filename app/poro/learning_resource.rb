class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(country, video, images)
    # require 'pry'; binding.pry
    @id = nil
    @country = country
    @video = video
    @images = images
  end
end