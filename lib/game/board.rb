require_relative 'field'
class Board

  attr_reader :fields

  def initialize
    @fields = (0..7).map { rand(1..100) }.map { |value| [Field.new(value), Field.new(value)] }.flatten
  end
end