class AgentsController < ApplicationController
  def show
    @agent = Agent.fetch(ENV['AGENT_TOKEN'])
    respond_to do |format|
      format.json { render json: @agent }
      format.html
    end
  end
end
