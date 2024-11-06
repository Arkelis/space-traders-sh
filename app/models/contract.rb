class Contract
  include ActiveModel::API

  attr_accessor :id, :faction_symbol, :type, :terms, :accepted, :fulfilled, :expiration, :deadline_to_accept

  class << self
    def fetch_all(token)
      contracts = Faraday.get('https://api.spacetraders.io/v2/my/contracts', nil, {'Authorization' => 'Bearer ' + token})
      parsed_body = JSON.parse(contracts.body)
      parsed_contracts = parsed_body['data']
      parsed_contracts.map do |contract| 
        Contract.new(**contract.deep_transform_keys(&:underscore))
      end
    end

    def accept(id, token)
      Faraday.post("https://api.spacetraders.io/v2/my/contracts/#{id}/accept", nil, {'Authorization' => 'Bearer ' + token})
    end
  end
end
