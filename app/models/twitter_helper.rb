class TwitterHelper

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end

  def tweets_to_alchemy_api
    @client.search("to:alchemyapi", result_type: "recent").take(15).collect do |tweet|
      tweet.text
    end
  end

  def tweets_tagged_alchemy_api
    @client.search("#alchemyapi", result_type: "recent").take(15).collect do |tweet|
      tweet.text
    end
  end
end