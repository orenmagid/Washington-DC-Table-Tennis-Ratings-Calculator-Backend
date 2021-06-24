class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create]

  def index
    @sessions = Session.from_most_recent
    render json: @sessions
  end

  def show
    @session = Session.find(params[:id])
    render json: @session, include: ["matches", "matches.players"]
  end

  def create
    matches = params[:matches]
    date = params[:date]
    session = Session.create(date: date, winner_id: params[:winner_id], loser_id: params[:loser_id])

    matches.each do |match|
      new_match = Match.create_match(match["winner"]["id"], match["loser"]["id"], session.id)
    end

    session.calculate_ratings(params[:winner_id], params[:loser_id])

    if session.save
      render json: session, status: :accepted
    end
  end
end
