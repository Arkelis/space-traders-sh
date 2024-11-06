class Agent < ApplicationRecord
  attr_accessor :account_id,
                :symbol,
                :headquarters,
                :credits,
                :starting_faction,
                :ship_count

  RESOURCE_URL = "https://api.spacetraders.io/v2/my/agent"

  class << self
    def fetch(token)
      payload = ApiResource.fetch("https://api.spacetraders.io/v2/my/agent", token)
      new(**payload)
    end

    def register(symbol)
      response =
        Faraday.post(
          "https://api.spacetraders.io/v2/register",
          "{\"symbol\":\"#{symbol}\",\"faction\":\"COSMIC\"}",
          "Content-Type" => "application/json"
        )
      agent = JSON.parse(response.body)
      Agent.create(name: symbol, token: agent["data"]["token"])
    end
  end
end
