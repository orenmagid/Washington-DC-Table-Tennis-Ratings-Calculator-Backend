class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @sessions = Session.all
    render json: @sessions, include: ["matches", "matches.players", "matches.players.ratings"]
  end

  def create
    matches = params[:matches]
    date = params[:date]
    recurring_session_id = params[:recurring_session_id]

    session = Session.create(date: date)
    recurring_session = RecurringSession.find(recurring_session_id)
    recurring_session.sessions.push(session)

    matches.each do |match|
      new_match = Match.create_match(match["winner"]["id"], match["loser"]["id"], session.id)
    end

    session.calculate_ratings

    if session.save
      render json: session, status: :accepted
    end
  end
end
