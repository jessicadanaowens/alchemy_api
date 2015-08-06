require './alchemyapi_ruby/alchemyapi'

class TextAnalyzer

  def initialize(text)
    @alchemyapi = AlchemyAPI.new()
    @text = text
  end

  def show_sentiment
    response = @alchemyapi.sentiment("text", @text)
    if response["docSentiment"] = []
      "No Sentiment"
    else
    "Sentiment: " + response["docSentiment"]["type"]
    end
  end
end

