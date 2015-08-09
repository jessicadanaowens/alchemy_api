class StackoverflowHelper

  def initialize
    @conn = Faraday.new(:url => 'https://api.stackexchange.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def links
    items.map { |item| item["link"] }
  end

  private

  def response
    @conn.get '/2.2/search/advanced?order=desc&sort=activity&tagged=alchemyapi&site=stackoverflow'
  end

  def parsed_body
    JSON.parse(response.body)
  end

  def items
    parsed_body["items"]
  end
end