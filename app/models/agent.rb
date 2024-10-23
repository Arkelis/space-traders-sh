class Agent < ApplicationRecord
  attr_accessor :account_id, :symbol, :headquarters, :credits, :starting_faction, :ship_count

  class << self
    def fetch(token)
      agent = Faraday.get('https://api.spacetraders.io/v2/my/agent', nil, {'Authorization' => 'Bearer ' + token})
      parsed_body = JSON.parse(agent.body)
      parsed_agent = parsed_body['data']
      Agent.new(**parsed_agent.deep_transform_keys(&:underscore))
    end

    def register(symbol)
      response = Faraday.post('https://api.spacetraders.io/v2/register',
        "{\"symbol\":\"#{symbol}\",\"faction\":\"COSMIC\"}",
        "Content-Type" => "application/json"
      )
      agent = JSON.parse(response.body)
      Agent.create(name: symbol, token: agent['data']['token'] )
    end
  end
end
