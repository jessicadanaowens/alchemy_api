class Analyzer

  def initialize(flavor, items)
    @positive = 0
    @negative = 0
    @neutral = 0
    @items = items
    @flavor = flavor
    @total = @items.length.to_f
  end

  def results
    analyze_items
    {positive: percent(@positive) + " positive", negative: percent(@negative) + " negative", neutral: percent(@neutral) + " neutral"}
  end

  def analyze_items
    @items.each do |item|
      if analyzed_item(item) == 'positive'
        @positive += 1
      elsif analyzed_item(item) == 'negative'
        @negative += 1
      else
        @neutral += 1
      end
    end
  end

  private

  def analyzed_item(item)
    sentiment_analyzer = AlchemyapiTextAnalyzer.new.sentiment(@flavor, item)

    if sentiment_analyzer == nil || sentiment_analyzer["docSentiment"] == nil || sentiment_analyzer["docSentiment"]["type"] == nil
      @total - 1
    elsif sentiment_analyzer["status"] == "ERROR"
      @total - 1
    else
      sentiment_analyzer["docSentiment"]["type"]
    end
  end

  def percent(sentiment)
    if sentiment < 1
      "0%"
    else
      decimal = sentiment.to_f / @total
      (decimal * 100).round(1).to_s + "%"
    end
  end
end