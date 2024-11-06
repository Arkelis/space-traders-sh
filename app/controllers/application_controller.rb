class ApplicationController < ActionController::Base
  helper_method :current_agent_symbol

  protected

  def current_agent_token
    session[:current_agent_token]
  end

  def current_agent_symbol
    session[:current_agent_symbol]
  end

  def set_current_agent(token:, name:)
    session[:current_agent_token] = token
    session[:current_agent_symbol] = name
  end
end
