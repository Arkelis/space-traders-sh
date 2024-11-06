class Waypoint
  include ActiveModel::API

  attr_accessor :symbol, :type, :traits

  def self.fetch_all(system:, traits:, token:)
    payloads =
      ApiResource.fetch(
        "https://api.spacetraders.io/v2/systems/#{system}/waypoints?traits=#{traits}",
        token
      )
    payloads.map { |payload| new(**payload.slice("symbol", "type", "traits")) }
  end
end
