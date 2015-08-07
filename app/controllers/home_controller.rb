class HomeController < ApplicationController
  def index


    text_analyzer = TextAnalyzer.new.show_sentiment

    @sentiment = text_analyzer

  end
end