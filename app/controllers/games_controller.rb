class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    @game.user = current_user
    if @game.save
      redirect_to games_path, flash: {success: "The game has been successfully created"}
    else
      flash[:notice] = "All required fields must be complete."
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.user != current_user
      redirect_to games_path, flash: {notice: "You are not authorized to edit this game."}
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.user == current_user
      @game.update_attributes(game_params)
      redirect_to games_path, flash: {success: "The game has been successfully updated"}
    else
      redirect_to games_path, flash: {notice: "You are not authorized to edit this game."}
    end  
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.user == current_user
      @game.destroy
      redirect_to games_path, flash: {success: "The game has been deleted"}
    else
      redirect_to games_path, flash: {notice: "You are not authorized to delete this game."}
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :url, :min_players, :max_players, :user_id)
  end
end
