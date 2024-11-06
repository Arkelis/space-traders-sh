class ShipsController < ApplicationController
  def index
    @ships = Ship.fetch_all(current_agent_token)
    respond_to do |format|
      format.json {render json: @ships}
      format.html
    end
  end
end
