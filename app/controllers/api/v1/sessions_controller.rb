class Api::V1::SessionsController < ApplicationController
  def index
    @sessions = Session.all
    render json: @sessions, include: ["group", "matches", "matches.players", "matches.players.ratings"]
  end
end
