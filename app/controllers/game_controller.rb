require_relative '../../lib/game/board'
class GameController < ApplicationController
  def index
    render json: ::Board.new
  end
end
