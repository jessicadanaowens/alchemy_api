class HomeController < ApplicationController
  def index

    text = "poop is smelly"

    text_analyzer = TextAnalyzer.new(text).show_sentiment

    @sentiment = text_analyzer

  end
end