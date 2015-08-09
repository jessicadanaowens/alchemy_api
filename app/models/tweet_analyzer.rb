class TweetAnalyzer

  def initialize(tweets)
    @positive = 0
    @negative = 0
    @neutral = 0
    @tweets = tweets
    @total = @tweets.length.to_f
  end

  def results
    analyze_tweets
    {positive: percent(@positive) + " positive", negative: percent(@negative) + " negative", neutral: percent(@neutral) + " neutral"}
  end

  def analyze_tweets
    @tweets.each do |tweet|
      if analyzed_tweet(tweet) == 'positive'
        @positive += 1
      elsif analyzed_tweet(tweet) == 'negative'
        @negative += 1
      else
        @neutral += 1
      end
    end
  end

  private

  def analyzed_tweet(tweet)
    if TextAnalyzer.new.sentiment("text", tweet)["status"] == "ERROR"
      @total - 1
    else
      TextAnalyzer.new.sentiment("text", tweet)["docSentiment"]["type"]
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