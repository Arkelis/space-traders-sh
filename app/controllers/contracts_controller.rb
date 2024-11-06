class ContractsController < ApplicationController
  def index
    @contracts = Contract.fetch_all(session[:current_agent_token])
    respond_to do |format|
      format.json {render json: @contracts}
      format.html
    end
  end

  def create
    Contract.accept(params[:id], session[:current_agent_token])
    redirect_to :contracts
  end
end

