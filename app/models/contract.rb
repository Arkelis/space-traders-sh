class Contract
  include ActiveModel::API

  RESOURCE_URL = "https://api.spacetraders.io/v2/my/contracts"

  attr_accessor :id,
                :faction_symbol,
                :type,
                :terms,
                :accepted,
                :fulfilled,
                :expiration,
                :deadline_to_accept

  class << self
    def fetch_all(token)
      payloads = ApiResource.fetch(RESOURCE_URL, token)
      payloads.map { |payload| new(**payload) }
    end

    def accept(id, token)
      Faraday.post(
        "#{RESOURCE_URL}/#{id}/accept",
        nil,
        { "Authorization" => "Bearer #{token}" }
      )
    end
  end
end
