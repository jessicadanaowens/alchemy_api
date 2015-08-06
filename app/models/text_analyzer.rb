require './alchemyapi_ruby/alchemyapi'

class TextAnalyzer

  def initialize(text)
    @alchemyapi = AlchemyAPI.new()
    @text = text
  end

  def show_sentiment
    response = @alchemyapi.sentiment("text", @text)
    "Sentiment: " + response["docSentiment"]["type"]
  end
end
