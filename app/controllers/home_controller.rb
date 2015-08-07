class HomeController < ApplicationController

  def index
    text_analysis = TextAnalyzer.new.get_text_sentiment("text", "I hate skiing!")["docSentiment"]

    @sentiment = text_analysis
  end
end