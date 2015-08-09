require 'net/http'
require 'uri'
require 'json'

class TwitterSentimentsController < ApplicationController
  respond_to :json

  def index
    tweets_to_alchemy_api = TwitterHelper.new.tweets_to_alchemy_api
    tweets_tagged_alchemy_api = TwitterHelper.new.tweets_tagged_alchemy_api

    @results = {}
    @results[:twitter] = {}

    @results[:twitter][:tweets_to_alchemy_api] = Analyzer.new("text", tweets_to_alchemy_api).results
    @results[:twitter][:tweets_tagged_alchemy_api] = Analyzer.new("text", tweets_tagged_alchemy_api).results

    render json: @results
  end
end