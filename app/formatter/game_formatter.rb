require_relative '../../lib/game/board'
class GameFormatter

  def self.show(game, field1, field2)
    check_if_pair(field1, field2, game) if field1 && field2
    reveal([field1, field2], game)
  end

  private

  def self.reveal(chosen_fields, game)
    game.state[:board].fields.map do |field|
      f = field.dup
      unless chosen_fields.include?(field.id) || field.matched
        f.value = 'unknown'
      end
      f
    end
  end

  def self.check_if_pair(field1, field2, game)
    first_field = game.state[:board].fields.select { |field| field.id == field1 }.first
    second_field = game.state[:board].fields.select { |field| field.id == field2 }.first
    if first_field.value == second_field.value
      first_field.matched = true
      second_field.matched = true
    end
  end
end