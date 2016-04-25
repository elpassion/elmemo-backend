require_relative '../../lib/game/board'
class GameController < ApplicationController

  def create
    @game = Game.create(state: {'board': ::Board.new})
    redirect_to game_show_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
    field1 = params[:field1]
    field2 = params[:field2]
    check_if_pair(field1, field2, @game) if field1 && field2
    game = render_for_no_params(@game.dup)
    game = reveal([field1, field2], @game.dup) if field1 || field2

    render json: game
  end

  private

  def reveal(chosen_fields, game)
    game.state[:board].fields.each do |field|
      field.value = 'unknown' unless chosen_fields.include?(field.id) || field.matched
    end
  end

  def check_if_pair(field1, field2, game)
    first_field = game.state[:board].fields.select { |field| field.id == field1 }.first
    second_field = game.state[:board].fields.select { |field| field.id == field2 }.first

    if first_field.value == second_field.value
      first_field.matched = true
      second_field.matched = true
    end
    game.save
  end

  def render_for_no_params(game)
    game.state[:board].fields.each do |field|
      field.value = 'unknown' unless field.matched
    end
  end
end
