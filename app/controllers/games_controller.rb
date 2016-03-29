class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = current_user.games.all
  end

  def new
    @game = Game.new
  end

  def create
    current_user.games.create(game_params)
    redirect_to games_path
  end

  def delete
    @game = current_user.games.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :url, :min_players, :max_players)
  end
end
