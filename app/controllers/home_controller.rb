class HomeController < ApplicationController

  def index
    # text_analysis = TextAnalyzer.new.get_text_sentiment("text", "I hate skiing!")["docSentiment"]

    @sentiment = TextAnalyzer.new.sentiment_targeted("text", "I hate the outdoors! Skiing is the worst outdoor sport.", "skiing")
  end
end