class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @sessions = Session.all.order("date DESC")
    render json: @sessions
  end

  def show
    @session = Session.find(params[:id])
    render json: @session, include: ["matches", "matches.players", "group"]
  end

  def create
    matches = params[:matches]
    date = params[:date]
    # date = Time.new(date)
    puts("date", date)
    group_id = params[:group_id]

    session = Session.create(date: date)
    group = Group.find(group_id)
    group.sessions.push(session)

    matches.each do |match|
      new_match = Match.create_match(match["winner"]["id"], match["loser"]["id"], session.id)
    end

    session.calculate_ratings

    if session.save
      render json: session, status: :accepted
    end
  end
end
