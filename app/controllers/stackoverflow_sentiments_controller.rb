require 'net/http'
require 'uri'
require 'json'

class StackoverflowSentimentsController < ApplicationController
  respond_to :json

  def index
    stackoverflow_links = StackoverflowHelper.new.links

    @results = {}
    @results[:stackoverflow] = {}

    @results[:stackoverflow][:tagged_alchemyapi] = Analyzer.new("url", stackoverflow_links).results

    render json: @results
  end
end