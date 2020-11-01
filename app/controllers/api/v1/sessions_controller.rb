class Api::V1::SessionsController < ApplicationController
  def index
    @sessions = Session.all
    render json: @sessions, include: ["group", "matches", "matches.players", "matches.players.ratings"]
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
