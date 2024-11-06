class AgentsController < ApplicationController
  def index
    @agents = Agent.all
  end

  def show
    @agent = Agent.fetch(current_agent_token)
    respond_to do |format|
      format.json { render json: @agent }
      format.html
    end
  end

  def create
    agent = Agent.register(params[:name])
    set_current_agent(token: agent.token, name: agent.name)
    redirect_to :agent
  end

  def update
    agent = Agent.find_by(name: params[:name])
    set_current_agent(token: agent.token, name: agent.name)
    redirect_to :agent
  end

  def destroy
    Agent.find_by(name: params[:name]).destroy!
    redirect_to :root
  end
end
