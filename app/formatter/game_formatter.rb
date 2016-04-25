require_relative '../../lib/game/board'
class GameFormatter

  def self.show(game, field1, field2)
    check_if_pair(field1, field2, game) if field1 && field2
    game2 = render_for_no_params(duplicate(game))
    game2 = reveal([field1, field2], duplicate(game)) if field1 || field2
    game2.state[:board].fields
  end

  private

  def self.reveal(chosen_fields, game)
    game.state[:board].fields.each do |field|
      field.value = 'unknown' unless chosen_fields.include?(field.id) || field.matched
    end
    game
  end

  def self.check_if_pair(field1, field2, game)
    first_field = game.state[:board].fields.select { |field| field.id == field1 }.first
    second_field = game.state[:board].fields.select { |field| field.id == field2 }.first
    if first_field.value == second_field.value
      first_field.matched = true
      second_field.matched = true
    end
  end

  def self.render_for_no_params(game)
    game.state[:board].fields.each do |field|
      field.value = 'unknown' unless field.matched
    end
    game
  end
end