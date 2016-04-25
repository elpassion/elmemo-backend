require_relative '../../lib/game/board'
class GameController < ApplicationController

  def create
    @game = Game.create(state: { 'board': ::Board.new })
    redirect_to game_show_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
    game = @game.dup
    puts game.state[:board].inspect
    game.state[:board].fields.each do |field|
      field.value = 'unknown'
    end
    render json: game[:state]
  end
end
