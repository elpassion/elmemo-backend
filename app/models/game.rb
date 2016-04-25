require_relative '../../lib/game/board'
class Game < ActiveRecord::Base

  before_create :create_state

  serialize :state, Hash

  private

  def create_state
    self.state = {'board': ::Board.new}
  end
end
