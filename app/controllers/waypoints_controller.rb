class WaypointsController < ApplicationController
  def index
    @waypoints =
      Waypoint.fetch_all(
        system: params[:system],
        token: current_agent_token,
        traits: params[:traits]
      )
    respond_to do |format|
      format.json { render json: @waypoints }
      format.html
    end
  end
end
