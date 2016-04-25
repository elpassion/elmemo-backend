require_relative 'field'
class Board
  def initialize
    @fields = Array.new(8) { Field.new }
  end
end