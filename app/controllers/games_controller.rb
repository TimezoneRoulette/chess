# Each game requires two signed-in human players (i.e. no AI)
# Coin flip decides which player is white (and thus plays first)
# Full implementation of rules, including castling, etc.
# Each player move is validated
# (eg: making sure pieces are not moved off the board)
# Game ends upon checkmate, stalemate or player resignation

class GamesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)

    if @game.valid?
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy
    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    @game.update_attributes(game_params)
    if @game.valid?
      redirect_to games_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
