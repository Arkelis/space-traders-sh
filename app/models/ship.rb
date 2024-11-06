class Ship
  include ActiveModel::API

  attr_accessor :symbol, :registration, :nav, :crew, :frame, :reactor, :engine, :cooldown, :modules, :mounts, :cargo, :fuel

  class << self
    def fetch_all(token)
      ships = Faraday.get('https://api.spacetraders.io/v2/my/ships', nil, {'Authorization' => 'Bearer ' + token})
      parsed_body = JSON.parse(ships.body)
      parsed_contracts = parsed_body['data']
      parsed_contracts.map do |contract| 
        Ship.new(**contract.deep_transform_keys(&:underscore))
      end
    end
  end
end
