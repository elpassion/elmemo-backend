require_relative 'field'

class Board

  attr_reader :fields

  def initialize
    @fields = (Array(1..8) + Array(1..8)).shuffle.map{ |value| Field.new(value) }
  end

  def is_won?
    @fields.map(&:matched).exclude?(false)
  end
end
