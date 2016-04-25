require_relative '../../lib/game/board'
class GameController < ApplicationController
  def create
    @game = Game.create(state: { 'board': 1 })
    redirect_to game_show_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end
end
