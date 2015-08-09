class HomeController < ApplicationController

  def index
    tweets_to_alchemy_api = TwitterHelper.new.tweets_to_alchemy_api
    tweets_tagged_alchemy_api = TwitterHelper.new.tweets_tagged_alchemy_api

    @results = {}
    @results[:tweets_to_alchemy_api] = TweetAnalyzer.new(tweets_to_alchemy_api).results
    @results[:tweets_tagged_alchemy_api] = TweetAnalyzer.new(tweets_tagged_alchemy_api).results
  end
end

