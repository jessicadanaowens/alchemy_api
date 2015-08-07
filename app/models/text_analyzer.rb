class TextAnalyzer

  def initialize
    AlchemyAPI.key = ENV["ALCHEMY_API_KEY"]
  end

  def show_sentiment
    results = AlchemyAPI::SentimentAnalysis.new.search(url: 'http://www.alchemyapi.com/')
    results
  end
end

