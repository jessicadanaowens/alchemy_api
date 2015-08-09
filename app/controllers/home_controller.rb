require 'net/http'
require 'uri'
require 'json'

class HomeController < ApplicationController
  respond_to :json

  def index
    tweets_to_alchemy_api = TwitterHelper.new.tweets_to_alchemy_api
    tweets_tagged_alchemy_api = TwitterHelper.new.tweets_tagged_alchemy_api
    stackoverflow_links = StackoverflowHelper.new.links

    @results = {}
    @results[:twitter] = {}
    @results[:stackoverflow] = {}

    @results[:twitter][:tweets_to_alchemy_api] = Analyzer.new("text", tweets_to_alchemy_api).results
    @results[:twitter][:tweets_tagged_alchemy_api] = Analyzer.new("text", tweets_tagged_alchemy_api).results
    @results[:stackoverflow][:tagged_alchemyapi] = Analyzer.new("url", stackoverflow_links).results
  end
end

