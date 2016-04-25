class Field

  attr_accessor :value

  def initialize(value)
    @id = SecureRandom.uuid
    @value = value
  end
end
