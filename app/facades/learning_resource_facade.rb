class LearningResourceFacade
  def self.get_learning_resource(country)
    video = VideoService.get_video(country)
    unless video[:items] == []
      video = {title: video[:items].first[:snippet][:title],
              youtube_video_id: video[:items].first[:id][:videoId]} 
    else
      video = []
    end
    images = ImagesService.get_images(country).map do |image|
      {
        alt_tag: image[:alt_description],
        url: image[:urls][:raw]
      }
    end
    resource = LearningResource.new(country, video, images)
  end
end