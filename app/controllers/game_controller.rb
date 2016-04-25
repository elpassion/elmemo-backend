require_relative '../../lib/game/board'
class GameController < ApplicationController

  def create
    @game = Game.create
    redirect_to game_show_path(@game.id)
  end

  def show
    render json: GameFormatter.show(Game.find(params[:id]), params[:field1], params[:field2])
  end
end
