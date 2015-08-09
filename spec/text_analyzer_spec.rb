require "rails_helper"

describe "TextAnalzer" do
  it "indicates when the text is positive" do
    text = "I love skiing."
    sentiment = AlchemyapiTextAnalyzer.new(text).show_sentiment

    expect(sentiment).to eq "Sentiment: positive"
    end

  it "indicates when the text is negative" do
    text = "I hate skiing."
    sentiment = AlchemyapiTextAnalyzer.new(text).show_sentiment

    expect(sentiment).to eq "Sentiment: negative"
  end

  it "indicates when the text is neutral" do
    text = "I want to climb Mount Everest one day."
    sentiment = AlchemyapiTextAnalyzer.new(text).show_sentiment

    expect(sentiment).to eq "Sentiment: neutral"
  end
end