class Agent

  attr_accessor :account_id, :symbol, :headquarters, :credits, :starting_faction, :ship_count

  def initialize(account_id:, symbol:, headquarters:, credits:, starting_faction:, ship_count:)
    @account_id = account_id
    @symbol = symbol
    @headquarters = headquarters
    @credits = credits
    @starting_faction = starting_faction
    @ship_count = ship_count
  end

  class << self
    def fetch(token)
      agent = Faraday.get('https://api.spacetraders.io/v2/my/agent', nil, {'Authorization' => 'Bearer ' + ENV['AGENT_TOKEN']})
      parsed_body = JSON.parse(agent.body)
      parsed_agent = parsed_body['data']
      Agent.new(
        account_id: parsed_agent['accountId'],
        symbol: parsed_agent['symbol'],
        headquarters: parsed_agent['headquarters'],
        credits: parsed_agent['credits'],
        starting_faction: parsed_agent['startingFaction'],
        ship_count: parsed_agent['shipCount']
      )
    end
  end
end
