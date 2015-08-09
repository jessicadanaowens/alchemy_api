Rails.application.routes.draw do
  get "/" => "home#index"
  get "/twitter_sentiments" => "twitter_sentiments#index"
  get "/stackoverflow_sentiments" => "stackoverflow_sentiments#index"
end
