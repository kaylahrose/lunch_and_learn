class VideoService
  def self.conn
    Faraday.new("https://youtube.googleapis.com") 
  end

  def self.get_video(country)
    response = conn.get("/youtube/v3/search?part=snippet&key=#{ENV['yt_key']}&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}}&type=video")
    video = JSON.parse(response.body, symbolize_names: true)
  end
end