class Field

  attr_accessor :value, :matched, :id

  def initialize(value)
    @id = SecureRandom.uuid
    @value = value
    @matched = false
  end
end
