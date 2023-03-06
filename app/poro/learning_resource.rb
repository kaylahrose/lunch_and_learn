class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(country, video, images)
    # require 'pry'; binding.pry
    @id = nil
    @country = country
    @video = {title: video[:items].first[:snippet][:title],
              youtube_video_id: video[:items].first[:id][:videoId]}
    @images = images
  end
end