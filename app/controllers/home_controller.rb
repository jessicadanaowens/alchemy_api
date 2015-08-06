class HomeController < ApplicationController
  def index

    text = "I love skiing."

    text_analyzer = TextAnalyzer.new(text).show_sentiment

    @sentiment = text_analyzer

  end
end