require_relative '../../lib/game/board'
class GameController < ApplicationController

  def create
    @game = Game.create
    render json: {game: game_show_url(@game.id)}
  end

  def show
    render json: GameFormatter.show(Game.find(params[:id]), params[:field1], params[:field2])
  end
end
