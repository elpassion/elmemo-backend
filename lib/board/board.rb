require_relative 'field'

class Board

  attr_reader :fields

  def initialize
    @fields = (Array(0..7) + Array(0..7)).shuffle.map{ |value| Field.new(value) }
  end

  def is_won?
    @fields.map(&:matched).exclude?(false)
  end
end
