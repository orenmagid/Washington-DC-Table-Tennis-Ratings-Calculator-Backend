class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @sessions = Session.from_most_recent
    render json: @sessions
  end

  def show
    date_array = params[:id].split("-")
    month = date_array[0]
    day = date_array[1]
    year = date_array[2]
    date = Time.new(year, month, day)
    @sessions = Session.where(date: date.beginning_of_day..date.end_of_day)
    render json: @sessions, include: ["matches", "matches.players"]
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
