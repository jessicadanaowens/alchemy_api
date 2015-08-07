require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

class TextAnalyzer

  def initialize
    @apiKey = ENV["ALCHEMY_API_KEY"]
  end

  def get_text_sentiment(flavor, data, options = {})
    options[flavor] = data
    return analyze('/text/TextGetTextSentiment', options)
  end

  private

  def analyze(url, options)

    url = 'http://access.alchemyapi.com/calls' + url

    options['apikey'] = @apiKey
    options['outputMode'] = 'json'

    uri = URI.parse(url)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(options)

    request['Accept-Encoding'] = 'identity'

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(request)
    end

    return JSON.parse(res.body)
  end
end



