class ApiResource
  class << self
    def fetch(url, token)
      api_response =
        Faraday.get(url, nil, { "Authorization" => "Bearer #{token}" })
      parsed_body = JSON.parse(api_response.body).deep_transform_keys(&:underscore)
      parsed_body["data"]
    end
  end
end
