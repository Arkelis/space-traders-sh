class AgentsController < ApplicationController
  def show
    agent = Faraday.get('https://api.spacetraders.io/v2/my/agent', nil, {'Authorization' => 'Bearer ' + ENV['AGENT_TOKEN']})
  render json: agent.body
  end
end
