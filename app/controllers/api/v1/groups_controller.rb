class Api::V1::GroupsController < ApplicationController
  def index
    @groups = Group.all
    render json: @groups, include: ["players", "players.groups", "players.ratings", "players.ratings.session"]
   
  end
  end

  def update
    group_id = params[:id]
    player_id = params[:player_id]
    @group = Group.find(group_id)
    player = Player.find(player_id)
    add_or_remove = params[:add_or_remove]

    if add_or_remove == "add"
      @group.players.push(player)
    else
      @group.players.delete(player)
    end
    @groups = Group.all
    @players = Player.all
   
    if @group.save
        render json: @group, status: :accepted
    end
  end
end
