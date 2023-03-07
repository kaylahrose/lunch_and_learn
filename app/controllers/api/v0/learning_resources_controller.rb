class Api::V0::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourceFacade.get_learning_resource(params[:country])
    # conn = Faraday.new("https://youtube.googleapis.com")
    # response = conn.get("/youtube/v3/search?part=snippet&key=#{ENV['yt_key']}&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{params[:country]}&type=video")
    # video = JSON.parse(response.body, symbolize_names: true)
    # conn = Faraday.new("https://api.unsplash.com")
    # response = conn.get("/search/photos?client_id=#{ENV['unsplash_key']}&query=#{params[:country]}")
    # data = JSON.parse(response.body, symbolize_names: true)[:results].first(10)
    # images = data.map do |image|
    #   {
    #     alt_tag: image[:alt_description],
    #     url: image[:urls][:raw]
    #   }
    # end
    # laos_resource = LearningResource.new(params[:country], video, images)
    render json: LearningResourceSerializer.new(resource)
  end
end