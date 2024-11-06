Rails.application.routes.draw do
  root to: "agents#index"
  resource :agent, only: [:show, :create, :update, :destroy]
  resources :contracts
  resources :ships
end
