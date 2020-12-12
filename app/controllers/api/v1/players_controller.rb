class Api::V1::PlayersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @players = Player.all
    render json: @players, include: ["matches", "ratings", "ratings.session"]
  end

  def create
    @player = Player.create(player_params)
    if @player.valid?
      render json: { player: PlayerSerializer.new(@player) }, status: :created
    else
      render json: { error: "failed to create player" }, status: :not_acceptable
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :username, :password)
  end
end
