class LearningResourceFacade
  def self.get_learning_resource(country)
    video = get_video(country)
    images = get_images(country)
    resource = LearningResource.new(country, video, images)
  end

  def self.get_video(country)
    video = VideoService.get_video(country)
    unless video[:items] == []
      {
       title: video[:items].first[:snippet][:title],
       youtube_video_id: video[:items].first[:id][:videoId]
      } 
    else
      {}
    end
  end

  def self.get_images(country)
    ImagesService.get_images(country).map do |image|
      {
        alt_tag: image[:alt_description],
        url: image[:urls][:raw]
      }
    end
  end
end