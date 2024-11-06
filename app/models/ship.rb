class Ship
  include ActiveModel::API

  RESOURCE_URL = "https://api.spacetraders.io/v2/my/ships"

  attr_accessor :symbol,
                :registration,
                :nav,
                :crew,
                :frame,
                :reactor,
                :engine,
                :cooldown,
                :modules,
                :mounts,
                :cargo,
                :fuel

  def self.fetch_all(token)
    payloads = ApiResource.fetch(RESOURCE_URL, token)
    payloads.map { |payload| new(**payload) }
  end
end
