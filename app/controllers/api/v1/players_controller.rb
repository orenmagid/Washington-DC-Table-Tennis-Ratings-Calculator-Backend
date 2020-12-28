class Api::V1::PlayersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @players = Player.all
    render json: @players, include: ["matches", "ratings", "ratings.session"]
  end

  def show
    @player = Player.find(params[:id])
    render json: @player, include: ["matches", "ratings", "ratings.session"]
  end

  def create
    @player = Player.create(player_params)
    if @player.valid?
      render json: { player: PlayerSerializer.new(@player) }, status: :created
    else
      render json: { error: "failed to create player" }, status: :not_acceptable
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player && @player.authenticate(player_params[:password])
      @player.update(password: player_params[:new_password])
      if @player.valid?
        render json: { player: PlayerSerializer.new(@player), success: true }, status: :accepted
      else
        render json: { player: PlayerSerializer.new(@player), success: false, validation_errors: @player.errors[:password] }
      end
    else
      render json: { message: "Invalid current password" }, status: :unauthorized
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :username, :password, :new_password)
  end
end
