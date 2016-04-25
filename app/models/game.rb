class Game < ActiveRecord::Base
  serialize :state, Hash
end
